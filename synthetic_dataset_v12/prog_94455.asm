; DESCRIPTION: Composite: Sets a single purple pixel at (8, 240) then Renders a magenta box of size 40x61 starting at (83, 128) then Renders a black disk with center (369, 134) and radius 40.
; PLAN: r0=8(x), r1=240(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=128(y), r7=40(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=369(x), r11=134(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 8
LDI r1, 240
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 128
LDI r7, 40
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 134
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
