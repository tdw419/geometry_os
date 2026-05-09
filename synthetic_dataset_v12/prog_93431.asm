; DESCRIPTION: Composite: Renders a orange disk with center (353, 147) and radius 15 then Places a white dot at position (482, 157) then Places a green 30x63 rectangle at position (283, 138).
; PLAN: r0=353(x), r1=147(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x), r6=157(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=283(x), r11=138(y), r12=30(width), r13=63(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 147
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 157
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 283
LDI r11, 138
LDI r12, 30
LDI r13, 63
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
