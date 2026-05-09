; DESCRIPTION: Composite: Places a orange circle of radius 24 at center (488, 160) then Places a yellow dot at position (78, 85) then Renders a cyan line between points (144, 63) and (177, 191).
; PLAN: r0=488(x), r1=160(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=85(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=144(x1), r11=63(y1), r12=177(x2), r13=191(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 160
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 85
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 144
LDI r11, 63
LDI r12, 177
LDI r13, 191
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
