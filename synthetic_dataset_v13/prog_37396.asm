; DESCRIPTION: Places a magenta line segment connecting (71, 173) to (477, 70).
; PLAN: r0=71(x1), r1=173(y1), r2=477(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 173
LDI r2, 477
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
