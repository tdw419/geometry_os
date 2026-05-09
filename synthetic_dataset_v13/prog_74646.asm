; DESCRIPTION: Composite: Places a blue dot at position (494, 128) then Creates a white rectangular region at (270, 144) spanning 44 by 71 pixels then Renders a magenta disk with center (245, 148) and radius 60.
; PLAN: r0=494(x), r1=128(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=144(y), r7=44(width), r8=71(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x), r11=148(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 494
LDI r1, 128
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 144
LDI r7, 44
LDI r8, 71
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 148
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
