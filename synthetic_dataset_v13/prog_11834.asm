; DESCRIPTION: Places a magenta line segment connecting (305, 63) to (233, 112).
; PLAN: r0=305(x1), r1=63(y1), r2=233(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 63
LDI r2, 233
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
