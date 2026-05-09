; DESCRIPTION: Composite: Sets a single red pixel at (258, 66) then Renders a white disk with center (220, 135) and radius 51 then Places a blue line segment connecting (93, 255) to (326, 141).
; PLAN: r0=258(x), r1=66(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=135(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=93(x1), r11=255(y1), r12=326(x2), r13=141(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 66
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 220
LDI r6, 135
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 93
LDI r11, 255
LDI r12, 326
LDI r13, 141
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
