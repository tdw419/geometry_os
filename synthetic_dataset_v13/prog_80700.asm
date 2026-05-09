; DESCRIPTION: Composite: Creates a green rectangular region at (373, 111) spanning 18 by 119 pixels then Places a blue dot at position (217, 180) then Renders a purple disk with center (299, 189) and radius 42.
; PLAN: r0=373(x), r1=111(y), r2=18(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=180(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=299(x), r11=189(y), r12=42(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 111
LDI r2, 18
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 180
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 299
LDI r11, 189
LDI r12, 42
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
