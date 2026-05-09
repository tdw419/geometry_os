; DESCRIPTION: Composite: Sets a single magenta pixel at (71, 210) then Draws a magenta line from (224, 2) to (38, 236) then Creates a purple circular shape at (331, 227) with radius 15.
; PLAN: r0=71(x), r1=210(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=224(x1), r6=2(y1), r7=38(x2), r8=236(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=227(y), r12=15(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 210
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 224
LDI r6, 2
LDI r7, 38
LDI r8, 236
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 227
LDI r12, 15
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
