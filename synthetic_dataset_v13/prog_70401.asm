; DESCRIPTION: Places a magenta line segment connecting (509, 241) to (450, 199).
; PLAN: r0=509(x1), r1=241(y1), r2=450(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 241
LDI r2, 450
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
