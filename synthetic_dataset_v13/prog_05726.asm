; DESCRIPTION: Places a magenta line segment connecting (205, 133) to (340, 31).
; PLAN: r0=205(x1), r1=133(y1), r2=340(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 133
LDI r2, 340
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
