; DESCRIPTION: Places a magenta line segment connecting (107, 135) to (120, 184).
; PLAN: r0=107(x1), r1=135(y1), r2=120(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 135
LDI r2, 120
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
