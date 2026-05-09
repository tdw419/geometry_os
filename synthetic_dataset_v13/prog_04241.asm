; DESCRIPTION: Composite: Places a blue dot at position (177, 125) then Renders a purple disk with center (237, 82) and radius 61 then Creates a yellow rectangular region at (380, 8) spanning 43 by 112 pixels.
; PLAN: r0=177(x), r1=125(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=237(x), r6=82(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=8(y), r12=43(width), r13=112(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 125
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 237
LDI r6, 82
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 8
LDI r12, 43
LDI r13, 112
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
