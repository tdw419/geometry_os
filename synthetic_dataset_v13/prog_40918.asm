; DESCRIPTION: Composite: Places a cyan 25x14 rectangle at position (79, 97) then Draws a black line from (96, 109) to (200, 49) then Sets a single blue pixel at (380, 72).
; PLAN: r0=79(x), r1=97(y), r2=25(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x1), r6=109(y1), r7=200(x2), r8=49(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=72(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 79
LDI r1, 97
LDI r2, 25
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 109
LDI r7, 200
LDI r8, 49
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 72
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
