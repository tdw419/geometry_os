; DESCRIPTION: Composite: Draws a purple circle centered at (140, 41) with radius 36 then Renders a white line between points (37, 0) and (24, 243).
; PLAN: r0=140(x), r1=41(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x1), r6=0(y1), r7=24(x2), r8=243(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 41
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 0
LDI r7, 24
LDI r8, 243
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
