; DESCRIPTION: Composite: Places a blue line segment connecting (396, 63) to (131, 134) then Renders a black disk with center (309, 169) and radius 74 then Places a white 56x85 rectangle at position (395, 24).
; PLAN: r0=396(x1), r1=63(y1), r2=131(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=169(y), r7=74(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=395(x), r11=24(y), r12=56(width), r13=85(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 63
LDI r2, 131
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 169
LDI r7, 74
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 395
LDI r11, 24
LDI r12, 56
LDI r13, 85
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
