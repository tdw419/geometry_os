; DESCRIPTION: Composite: Places a red dot at position (187, 167) then Renders a purple box of size 99x23 starting at (332, 135) then Renders a black disk with center (114, 210) and radius 45.
; PLAN: r0=187(x), r1=167(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=135(y), r7=99(width), r8=23(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=114(x), r11=210(y), r12=45(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 167
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 332
LDI r6, 135
LDI r7, 99
LDI r8, 23
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 210
LDI r12, 45
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
