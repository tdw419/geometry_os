; DESCRIPTION: Places a magenta line segment connecting (445, 0) to (427, 225).
; PLAN: r0=445(x1), r1=0(y1), r2=427(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 0
LDI r2, 427
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
