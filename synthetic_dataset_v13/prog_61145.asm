; DESCRIPTION: Composite: Draws a blue line from (305, 218) to (370, 123) then Places a blue dot at position (483, 18).
; PLAN: r0=305(x1), r1=218(y1), r2=370(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=18(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 218
LDI r2, 370
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 18
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
