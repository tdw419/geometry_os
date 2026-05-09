; DESCRIPTION: Places a magenta line segment connecting (191, 167) to (340, 79).
; PLAN: r0=191(x1), r1=167(y1), r2=340(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 167
LDI r2, 340
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
