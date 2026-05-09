; DESCRIPTION: Composite: Places a black dot at position (383, 205) then Places a purple line segment connecting (441, 54) to (362, 1) then Renders a black disk with center (348, 167) and radius 39.
; PLAN: r0=383(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=441(x1), r6=54(y1), r7=362(x2), r8=1(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=348(x), r11=167(y), r12=39(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 383
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 441
LDI r6, 54
LDI r7, 362
LDI r8, 1
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 167
LDI r12, 39
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
