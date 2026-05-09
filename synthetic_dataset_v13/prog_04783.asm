; DESCRIPTION: Composite: Draws a yellow line from (87, 6) to (305, 65) then Draws a purple rectangle at (141, 121) with width 40 and height 91.
; PLAN: r0=87(x1), r1=6(y1), r2=305(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=121(y), r7=40(width), r8=91(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 6
LDI r2, 305
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 121
LDI r7, 40
LDI r8, 91
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
