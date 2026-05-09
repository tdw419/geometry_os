; DESCRIPTION: Composite: Places a black circle of radius 80 at center (346, 156) then Places a purple dot at position (188, 248) then Places a yellow 48x62 rectangle at position (184, 66).
; PLAN: r0=346(x), r1=156(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=248(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=184(x), r11=66(y), r12=48(width), r13=62(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 156
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 248
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 184
LDI r11, 66
LDI r12, 48
LDI r13, 62
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
