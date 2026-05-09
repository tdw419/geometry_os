; DESCRIPTION: Places a magenta line segment connecting (173, 247) to (159, 88).
; PLAN: r0=173(x1), r1=247(y1), r2=159(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 247
LDI r2, 159
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
