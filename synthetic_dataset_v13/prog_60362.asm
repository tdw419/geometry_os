; DESCRIPTION: Composite: Places a yellow 66x87 rectangle at position (136, 20) then Sets a single magenta pixel at (457, 188) then Places a white circle of radius 17 at center (107, 44).
; PLAN: r0=136(x), r1=20(y), r2=66(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x), r6=188(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=107(x), r11=44(y), r12=17(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 136
LDI r1, 20
LDI r2, 66
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 188
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 107
LDI r11, 44
LDI r12, 17
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
