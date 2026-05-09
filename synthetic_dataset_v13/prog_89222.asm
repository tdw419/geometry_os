; DESCRIPTION: Composite: Renders a magenta disk with center (220, 176) and radius 64 then Draws a green line from (142, 163) to (22, 5) then Sets a single blue pixel at (368, 216).
; PLAN: r0=220(x), r1=176(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x1), r6=163(y1), r7=22(x2), r8=5(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=216(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 176
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 163
LDI r7, 22
LDI r8, 5
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 216
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
