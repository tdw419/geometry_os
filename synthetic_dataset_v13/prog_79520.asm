; DESCRIPTION: Composite: Creates a green circular shape at (102, 122) with radius 29 then Sets a single red pixel at (234, 177) then Draws a orange line from (142, 215) to (37, 204).
; PLAN: r0=102(x), r1=122(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=177(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=142(x1), r11=215(y1), r12=37(x2), r13=204(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 122
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 177
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 142
LDI r11, 215
LDI r12, 37
LDI r13, 204
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
