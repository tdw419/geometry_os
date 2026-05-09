; DESCRIPTION: Places a magenta line segment connecting (6, 98) to (378, 187).
; PLAN: r0=6(x1), r1=98(y1), r2=378(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 98
LDI r2, 378
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
