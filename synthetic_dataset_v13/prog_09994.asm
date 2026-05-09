; DESCRIPTION: Composite: Renders a green disk with center (157, 125) and radius 58 then Creates a yellow rectangular region at (234, 178) spanning 27 by 63 pixels then Places a cyan dot at position (402, 253).
; PLAN: r0=157(x), r1=125(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=178(y), r7=27(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=402(x), r11=253(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 125
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 178
LDI r7, 27
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 253
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
