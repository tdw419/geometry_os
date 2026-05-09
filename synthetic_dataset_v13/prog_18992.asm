; DESCRIPTION: Composite: Places a yellow line segment connecting (360, 147) to (49, 155) then Places a yellow dot at position (161, 204).
; PLAN: r0=360(x1), r1=147(y1), r2=49(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=204(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 147
LDI r2, 49
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 204
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
