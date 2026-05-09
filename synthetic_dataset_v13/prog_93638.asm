; DESCRIPTION: Composite: Sets a single yellow pixel at (233, 197) then Renders a magenta disk with center (241, 159) and radius 63 then Creates a white rectangular region at (55, 96) spanning 27 by 36 pixels.
; PLAN: r0=233(x), r1=197(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=159(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x), r11=96(y), r12=27(width), r13=36(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 197
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 241
LDI r6, 159
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 96
LDI r12, 27
LDI r13, 36
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
