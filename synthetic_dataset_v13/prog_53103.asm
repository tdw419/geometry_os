; DESCRIPTION: Composite: Places a red circle of radius 28 at center (275, 164) then Places a purple dot at position (414, 243) then Creates a purple rectangular region at (113, 48) spanning 26 by 115 pixels.
; PLAN: r0=275(x), r1=164(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=243(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=113(x), r11=48(y), r12=26(width), r13=115(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 164
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 243
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 113
LDI r11, 48
LDI r12, 26
LDI r13, 115
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
