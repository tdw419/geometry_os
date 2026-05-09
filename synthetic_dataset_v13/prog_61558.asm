; DESCRIPTION: Composite: Renders a yellow disk with center (119, 125) and radius 25 then Sets a single blue pixel at (453, 204) then Places a red 21x30 rectangle at position (68, 12).
; PLAN: r0=119(x), r1=125(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x), r6=204(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=68(x), r11=12(y), r12=21(width), r13=30(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 125
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 204
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 68
LDI r11, 12
LDI r12, 21
LDI r13, 30
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
