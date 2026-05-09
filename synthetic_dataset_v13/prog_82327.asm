; DESCRIPTION: Composite: Places a black line segment connecting (6, 134) to (418, 148) then Places a white dot at position (45, 76).
; PLAN: r0=6(x1), r1=134(y1), r2=418(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=76(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 6
LDI r1, 134
LDI r2, 418
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 76
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
