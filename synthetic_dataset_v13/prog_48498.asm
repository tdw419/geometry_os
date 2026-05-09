; DESCRIPTION: Composite: Places a magenta line segment connecting (109, 172) to (135, 187) then Places a magenta dot at position (463, 251).
; PLAN: r0=109(x1), r1=172(y1), r2=135(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=251(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 172
LDI r2, 135
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 251
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
