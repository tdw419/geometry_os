; DESCRIPTION: Composite: Sets a single yellow pixel at (369, 106) then Renders a white line between points (299, 238) and (219, 209).
; PLAN: r0=369(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=299(x1), r6=238(y1), r7=219(x2), r8=209(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 106
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 299
LDI r6, 238
LDI r7, 219
LDI r8, 209
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
