; DESCRIPTION: Places a magenta line segment connecting (228, 250) to (363, 153).
; PLAN: r0=228(x1), r1=250(y1), r2=363(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 250
LDI r2, 363
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
