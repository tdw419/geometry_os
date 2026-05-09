; DESCRIPTION: Composite: Places a black 25x20 rectangle at position (204, 162) then Draws a orange line from (77, 113) to (3, 20) then Sets a single purple pixel at (420, 244).
; PLAN: r0=204(x), r1=162(y), r2=25(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x1), r6=113(y1), r7=3(x2), r8=20(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=244(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 162
LDI r2, 25
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 113
LDI r7, 3
LDI r8, 20
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 244
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
