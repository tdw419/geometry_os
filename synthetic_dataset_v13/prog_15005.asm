; DESCRIPTION: Composite: Places a red 85x52 rectangle at position (130, 155) then Places a green circle of radius 66 at center (355, 154) then Places a yellow dot at position (133, 232).
; PLAN: r0=130(x), r1=155(y), r2=85(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=154(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=133(x), r11=232(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 130
LDI r1, 155
LDI r2, 85
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 154
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 133
LDI r11, 232
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
