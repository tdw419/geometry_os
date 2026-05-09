; DESCRIPTION: Composite: Places a purple 90x105 rectangle at position (0, 19) then Draws a yellow line from (392, 146) to (56, 81).
; PLAN: r0=0(x), r1=19(y), r2=90(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x1), r6=146(y1), r7=56(x2), r8=81(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 19
LDI r2, 90
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 146
LDI r7, 56
LDI r8, 81
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
