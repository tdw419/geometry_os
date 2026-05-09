; DESCRIPTION: Composite: Places a magenta line segment connecting (71, 234) to (187, 56) then Sets a single purple pixel at (197, 226) then Creates a red circular shape at (94, 179) with radius 67.
; PLAN: r0=71(x1), r1=234(y1), r2=187(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=226(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=94(x), r11=179(y), r12=67(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 234
LDI r2, 187
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 226
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 94
LDI r11, 179
LDI r12, 67
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
