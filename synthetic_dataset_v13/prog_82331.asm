; DESCRIPTION: Composite: Renders a black box of size 112x46 starting at (26, 203) then Places a cyan line segment connecting (469, 252) to (315, 110) then Sets a single white pixel at (100, 151).
; PLAN: r0=26(x), r1=203(y), r2=112(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x1), r6=252(y1), r7=315(x2), r8=110(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=151(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 26
LDI r1, 203
LDI r2, 112
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 252
LDI r7, 315
LDI r8, 110
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 151
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
