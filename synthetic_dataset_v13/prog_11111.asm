; DESCRIPTION: Places a magenta line segment connecting (167, 80) to (207, 107).
; PLAN: r0=167(x1), r1=80(y1), r2=207(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 80
LDI r2, 207
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
