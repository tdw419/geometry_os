; DESCRIPTION: Composite: Places a yellow 110x91 rectangle at position (1, 52) then Draws a purple line from (74, 145) to (340, 198).
; PLAN: r0=1(x), r1=52(y), r2=110(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x1), r6=145(y1), r7=340(x2), r8=198(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 52
LDI r2, 110
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 145
LDI r7, 340
LDI r8, 198
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
