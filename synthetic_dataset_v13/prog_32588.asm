; DESCRIPTION: Composite: Sets a single magenta pixel at (63, 163) then Renders a cyan disk with center (102, 177) and radius 32 then Creates a blue rectangular region at (251, 110) spanning 24 by 65 pixels.
; PLAN: r0=63(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=177(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x), r11=110(y), r12=24(width), r13=65(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 102
LDI r6, 177
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 110
LDI r12, 24
LDI r13, 65
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
