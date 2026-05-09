; DESCRIPTION: Composite: Places a orange line segment connecting (153, 27) to (413, 105) then Places a yellow dot at position (115, 58).
; PLAN: r0=153(x1), r1=27(y1), r2=413(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=58(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 153
LDI r1, 27
LDI r2, 413
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 58
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
