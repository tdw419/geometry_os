; DESCRIPTION: Composite: Draws a blue line from (468, 234) to (251, 35) then Places a blue dot at position (28, 238).
; PLAN: r0=468(x1), r1=234(y1), r2=251(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=28(x), r6=238(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 468
LDI r1, 234
LDI r2, 251
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 238
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
