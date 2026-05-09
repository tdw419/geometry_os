; DESCRIPTION: Composite: Sets a single blue pixel at (95, 66) then Renders a green disk with center (316, 224) and radius 24 then Places a cyan 77x71 rectangle at position (44, 47).
; PLAN: r0=95(x), r1=66(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=224(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=44(x), r11=47(y), r12=77(width), r13=71(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 66
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 316
LDI r6, 224
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 44
LDI r11, 47
LDI r12, 77
LDI r13, 71
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
