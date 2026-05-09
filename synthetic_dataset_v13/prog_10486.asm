; DESCRIPTION: Composite: Draws a green line from (266, 203) to (223, 110) then Places a black dot at position (386, 1).
; PLAN: r0=266(x1), r1=203(y1), r2=223(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=1(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 203
LDI r2, 223
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 1
LDI r7, 0x000000
PSET r5, r6, r7
HALT
