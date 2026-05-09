; DESCRIPTION: Composite: Draws a cyan line from (336, 51) to (490, 159) then Renders a black disk with center (187, 68) and radius 65.
; PLAN: r0=336(x1), r1=51(y1), r2=490(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=68(y), r7=65(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 51
LDI r2, 490
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 68
LDI r7, 65
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
