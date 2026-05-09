; DESCRIPTION: Composite: Places a blue line segment connecting (217, 226) to (393, 89) then Places a orange dot at position (225, 238).
; PLAN: r0=217(x1), r1=226(y1), r2=393(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=238(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 217
LDI r1, 226
LDI r2, 393
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 238
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
