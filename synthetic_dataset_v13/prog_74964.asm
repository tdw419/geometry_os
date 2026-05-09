; DESCRIPTION: Composite: Renders a blue disk with center (179, 210) and radius 33 then Places a purple dot at position (164, 207) then Places a yellow line segment connecting (168, 147) to (274, 21).
; PLAN: r0=179(x), r1=210(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=207(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=168(x1), r11=147(y1), r12=274(x2), r13=21(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 210
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 207
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 147
LDI r12, 274
LDI r13, 21
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
