; DESCRIPTION: Composite: Renders a black line between points (188, 164) and (443, 194) then Sets a single white pixel at (336, 56).
; PLAN: r0=188(x1), r1=164(y1), r2=443(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=56(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 164
LDI r2, 443
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 56
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
