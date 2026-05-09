; DESCRIPTION: Places a magenta line segment connecting (503, 26) to (361, 34).
; PLAN: r0=503(x1), r1=26(y1), r2=361(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 26
LDI r2, 361
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
