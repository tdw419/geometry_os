; DESCRIPTION: Composite: Places a purple 110x46 rectangle at position (292, 172) then Renders a green disk with center (348, 195) and radius 49 then Sets a single black pixel at (6, 170).
; PLAN: r0=292(x), r1=172(y), r2=110(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=195(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x), r11=170(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 172
LDI r2, 110
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 195
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 170
LDI r12, 0x000000
PSET r10, r11, r12
HALT
