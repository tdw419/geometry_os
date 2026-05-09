; DESCRIPTION: Composite: Places a green circle of radius 10 at center (109, 159) then Sets a single magenta pixel at (509, 1) then Places a yellow 53x99 rectangle at position (260, 73).
; PLAN: r0=109(x), r1=159(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=509(x), r6=1(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=260(x), r11=73(y), r12=53(width), r13=99(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 159
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 509
LDI r6, 1
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 260
LDI r11, 73
LDI r12, 53
LDI r13, 99
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
