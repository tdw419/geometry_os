; DESCRIPTION: Places a magenta line segment connecting (139, 193) to (445, 144).
; PLAN: r0=139(x1), r1=193(y1), r2=445(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 193
LDI r2, 445
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
