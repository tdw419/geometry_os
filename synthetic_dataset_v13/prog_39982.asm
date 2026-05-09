; DESCRIPTION: Composite: Creates a red circular shape at (148, 126) with radius 73 then Draws a black line from (40, 45) to (195, 58).
; PLAN: r0=148(x), r1=126(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x1), r6=45(y1), r7=195(x2), r8=58(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 126
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 45
LDI r7, 195
LDI r8, 58
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
