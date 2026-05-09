; DESCRIPTION: Composite: Renders a blue line between points (2, 33) and (475, 55) then Sets a single orange pixel at (107, 44).
; PLAN: r0=2(x1), r1=33(y1), r2=475(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=44(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 2
LDI r1, 33
LDI r2, 475
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 44
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
