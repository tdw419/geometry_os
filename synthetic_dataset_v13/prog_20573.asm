; DESCRIPTION: Composite: Renders a magenta disk with center (355, 147) and radius 69 then Places a blue line segment connecting (473, 8) to (141, 249) then Sets a single purple pixel at (369, 87).
; PLAN: r0=355(x), r1=147(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x1), r6=8(y1), r7=141(x2), r8=249(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=87(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 355
LDI r1, 147
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 8
LDI r7, 141
LDI r8, 249
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 87
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
