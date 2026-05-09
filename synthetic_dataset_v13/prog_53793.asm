; DESCRIPTION: Composite: Draws a black line from (323, 199) to (154, 24) then Places a black circle of radius 46 at center (311, 192).
; PLAN: r0=323(x1), r1=199(y1), r2=154(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=192(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 323
LDI r1, 199
LDI r2, 154
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 192
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
