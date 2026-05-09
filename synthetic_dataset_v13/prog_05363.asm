; DESCRIPTION: Composite: Renders a cyan disk with center (201, 88) and radius 73 then Draws a black line from (131, 194) to (388, 23).
; PLAN: r0=201(x), r1=88(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x1), r6=194(y1), r7=388(x2), r8=23(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 88
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 194
LDI r7, 388
LDI r8, 23
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
