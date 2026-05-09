; DESCRIPTION: Places a magenta line segment connecting (245, 7) to (466, 60).
; PLAN: r0=245(x1), r1=7(y1), r2=466(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 7
LDI r2, 466
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
