; DESCRIPTION: Composite: Places a blue circle of radius 65 at center (184, 117) then Places a yellow dot at position (436, 69) then Places a purple line segment connecting (205, 117) to (508, 42).
; PLAN: r0=184(x), r1=117(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=69(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=205(x1), r11=117(y1), r12=508(x2), r13=42(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 117
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 69
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 205
LDI r11, 117
LDI r12, 508
LDI r13, 42
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
