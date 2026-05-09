; DESCRIPTION: Composite: Sets a single purple pixel at (193, 209) then Places a blue line segment connecting (72, 229) to (303, 232) then Creates a magenta circular shape at (177, 191) with radius 28.
; PLAN: r0=193(x), r1=209(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=72(x1), r6=229(y1), r7=303(x2), r8=232(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=191(y), r12=28(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 209
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 229
LDI r7, 303
LDI r8, 232
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 191
LDI r12, 28
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
