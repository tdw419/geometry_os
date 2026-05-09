; DESCRIPTION: Composite: Sets a single yellow pixel at (44, 188) then Places a blue line segment connecting (356, 175) to (399, 166).
; PLAN: r0=44(x), r1=188(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=356(x1), r6=175(y1), r7=399(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 188
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 356
LDI r6, 175
LDI r7, 399
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
