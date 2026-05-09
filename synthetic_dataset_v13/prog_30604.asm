; DESCRIPTION: Composite: Places a red circle of radius 48 at center (142, 99) then Places a white dot at position (382, 175) then Renders a green box of size 13x60 starting at (421, 192).
; PLAN: r0=142(x), r1=99(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=175(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=421(x), r11=192(y), r12=13(width), r13=60(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 99
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 175
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 421
LDI r11, 192
LDI r12, 13
LDI r13, 60
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
