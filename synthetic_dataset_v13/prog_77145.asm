; DESCRIPTION: Composite: Creates a blue circular shape at (386, 148) with radius 37 then Places a cyan dot at position (457, 195) then Creates a yellow rectangular region at (419, 178) spanning 62 by 27 pixels.
; PLAN: r0=386(x), r1=148(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=195(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=178(y), r12=62(width), r13=27(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 148
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 195
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 178
LDI r12, 62
LDI r13, 27
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
