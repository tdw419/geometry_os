; DESCRIPTION: Places a magenta line segment connecting (503, 61) to (177, 222).
; PLAN: r0=503(x1), r1=61(y1), r2=177(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 61
LDI r2, 177
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
