; DESCRIPTION: Composite: Renders a black box of size 96x21 starting at (202, 85) then Renders a red disk with center (235, 167) and radius 28 then Sets a single orange pixel at (28, 196).
; PLAN: r0=202(x), r1=85(y), r2=96(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=167(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=28(x), r11=196(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 85
LDI r2, 96
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 167
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 28
LDI r11, 196
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
