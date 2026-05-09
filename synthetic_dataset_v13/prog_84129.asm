; DESCRIPTION: Composite: Places a white line segment connecting (137, 133) to (330, 183) then Places a blue dot at position (324, 55).
; PLAN: r0=137(x1), r1=133(y1), r2=330(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=55(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 133
LDI r2, 330
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 55
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
