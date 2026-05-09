; DESCRIPTION: Places a magenta line segment connecting (61, 150) to (302, 82).
; PLAN: r0=61(x1), r1=150(y1), r2=302(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 150
LDI r2, 302
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
