; DESCRIPTION: Places a magenta line segment connecting (380, 196) to (311, 9).
; PLAN: r0=380(x1), r1=196(y1), r2=311(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 196
LDI r2, 311
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
