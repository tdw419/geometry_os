; DESCRIPTION: Places a blue line segment connecting (401, 26) to (414, 82).
; PLAN: r0=401(x1), r1=26(y1), r2=414(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 26
LDI r2, 414
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
