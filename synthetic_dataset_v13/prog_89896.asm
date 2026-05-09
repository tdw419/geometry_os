; DESCRIPTION: Composite: Sets a single purple pixel at (0, 115) then Renders a red box of size 18x114 starting at (80, 106) then Places a purple line segment connecting (322, 195) to (423, 101).
; PLAN: r0=0(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=106(y), r7=18(width), r8=114(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=322(x1), r11=195(y1), r12=423(x2), r13=101(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 0
LDI r1, 115
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 106
LDI r7, 18
LDI r8, 114
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 195
LDI r12, 423
LDI r13, 101
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
