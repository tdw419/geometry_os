; DESCRIPTION: Composite: Sets a single magenta pixel at (419, 18) then Creates a purple rectangular region at (374, 147) spanning 37 by 66 pixels then Renders a black disk with center (79, 130) and radius 18.
; PLAN: r0=419(x), r1=18(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=147(y), r7=37(width), r8=66(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=79(x), r11=130(y), r12=18(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 419
LDI r1, 18
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 147
LDI r7, 37
LDI r8, 66
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 130
LDI r12, 18
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
