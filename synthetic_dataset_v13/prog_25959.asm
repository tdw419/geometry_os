; DESCRIPTION: Composite: Places a blue line segment connecting (386, 101) to (161, 178) then Sets a single black pixel at (298, 122).
; PLAN: r0=386(x1), r1=101(y1), r2=161(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=122(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 101
LDI r2, 161
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 122
LDI r7, 0x000000
PSET r5, r6, r7
HALT
