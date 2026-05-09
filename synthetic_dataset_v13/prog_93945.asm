; DESCRIPTION: Composite: Places a blue 11x89 rectangle at position (247, 7) then Sets a single red pixel at (58, 248) then Renders a yellow disk with center (123, 108) and radius 79.
; PLAN: r0=247(x), r1=7(y), r2=11(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=248(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=108(y), r12=79(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 7
LDI r2, 11
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 248
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 123
LDI r11, 108
LDI r12, 79
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
