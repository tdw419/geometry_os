; DESCRIPTION: Composite: Places a black dot at position (19, 119) then Places a magenta line segment connecting (175, 100) to (501, 19).
; PLAN: r0=19(x), r1=119(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=175(x1), r6=100(y1), r7=501(x2), r8=19(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 119
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 175
LDI r6, 100
LDI r7, 501
LDI r8, 19
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
