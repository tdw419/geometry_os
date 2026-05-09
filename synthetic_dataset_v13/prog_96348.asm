; DESCRIPTION: Composite: Places a black circle of radius 30 at center (97, 95) then Places a blue dot at position (150, 200) then Creates a blue rectangular region at (190, 176) spanning 48 by 48 pixels.
; PLAN: r0=97(x), r1=95(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=200(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=176(y), r12=48(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 95
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 200
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 190
LDI r11, 176
LDI r12, 48
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
