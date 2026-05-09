; DESCRIPTION: Composite: Renders a cyan disk with center (150, 201) and radius 32 then Places a purple dot at position (390, 90) then Creates a black rectangular region at (423, 150) spanning 68 by 106 pixels.
; PLAN: r0=150(x), r1=201(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x), r6=90(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=423(x), r11=150(y), r12=68(width), r13=106(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 201
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 90
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 423
LDI r11, 150
LDI r12, 68
LDI r13, 106
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
