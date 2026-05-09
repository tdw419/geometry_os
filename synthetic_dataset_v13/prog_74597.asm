; DESCRIPTION: Composite: Sets a single blue pixel at (78, 223) then Renders a blue disk with center (42, 63) and radius 27 then Places a blue line segment connecting (26, 133) to (462, 120).
; PLAN: r0=78(x), r1=223(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=63(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x1), r11=133(y1), r12=462(x2), r13=120(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 223
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 63
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 133
LDI r12, 462
LDI r13, 120
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
