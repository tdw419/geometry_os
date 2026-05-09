; DESCRIPTION: Composite: Places a orange line segment connecting (146, 254) to (171, 23) then Places a blue dot at position (457, 211).
; PLAN: r0=146(x1), r1=254(y1), r2=171(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=211(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 254
LDI r2, 171
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 211
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
