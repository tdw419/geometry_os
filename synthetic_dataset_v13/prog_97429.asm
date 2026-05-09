; DESCRIPTION: Composite: Places a black 81x52 rectangle at position (254, 23) then Renders a red disk with center (127, 148) and radius 79 then Places a yellow dot at position (26, 145).
; PLAN: r0=254(x), r1=23(y), r2=81(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=148(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x), r11=145(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 254
LDI r1, 23
LDI r2, 81
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 148
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 145
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
