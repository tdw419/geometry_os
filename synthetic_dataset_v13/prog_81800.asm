; DESCRIPTION: Composite: Draws a green line from (161, 148) to (33, 193) then Sets a single black pixel at (8, 170).
; PLAN: r0=161(x1), r1=148(y1), r2=33(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=8(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 148
LDI r2, 33
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
HALT
