; DESCRIPTION: Composite: Renders a orange disk with center (332, 117) and radius 43 then Places a red dot at position (269, 136) then Renders a green box of size 56x36 starting at (162, 123).
; PLAN: r0=332(x), r1=117(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=136(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=162(x), r11=123(y), r12=56(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 117
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 136
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 162
LDI r11, 123
LDI r12, 56
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
