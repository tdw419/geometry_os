; DESCRIPTION: Composite: Creates a red circular shape at (287, 204) with radius 35 then Renders a black line between points (362, 250) and (300, 247).
; PLAN: r0=287(x), r1=204(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x1), r6=250(y1), r7=300(x2), r8=247(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 204
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 250
LDI r7, 300
LDI r8, 247
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
