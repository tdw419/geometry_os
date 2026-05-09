; DESCRIPTION: Composite: Draws a blue line from (167, 72) to (439, 212) then Places a red 33x69 rectangle at position (395, 97) then Sets a single purple pixel at (60, 3).
; PLAN: r0=167(x1), r1=72(y1), r2=439(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=97(y), r7=33(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=60(x), r11=3(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 72
LDI r2, 439
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 97
LDI r7, 33
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 3
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
