; DESCRIPTION: Composite: Places a cyan circle of radius 25 at center (169, 140) then Sets a single blue pixel at (446, 187) then Places a magenta line segment connecting (445, 191) to (418, 230).
; PLAN: r0=169(x), r1=140(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=187(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=445(x1), r11=191(y1), r12=418(x2), r13=230(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 140
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 187
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 445
LDI r11, 191
LDI r12, 418
LDI r13, 230
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
