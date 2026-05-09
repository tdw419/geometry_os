; DESCRIPTION: Composite: Draws a purple line from (333, 94) to (461, 176) then Creates a purple rectangular region at (96, 180) spanning 115 by 19 pixels.
; PLAN: r0=333(x1), r1=94(y1), r2=461(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=180(y), r7=115(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 94
LDI r2, 461
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 180
LDI r7, 115
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
