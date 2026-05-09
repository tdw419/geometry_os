; DESCRIPTION: Composite: Places a black line segment connecting (12, 69) to (324, 150) then Sets a single white pixel at (137, 204).
; PLAN: r0=12(x1), r1=69(y1), r2=324(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=204(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 69
LDI r2, 324
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 204
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
