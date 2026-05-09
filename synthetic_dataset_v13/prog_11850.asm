; DESCRIPTION: Composite: Places a magenta line segment connecting (366, 183) to (310, 47) then Sets a single purple pixel at (69, 168).
; PLAN: r0=366(x1), r1=183(y1), r2=310(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=168(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 183
LDI r2, 310
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 168
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
