; DESCRIPTION: Places a magenta line segment connecting (266, 50) to (174, 244).
; PLAN: r0=266(x1), r1=50(y1), r2=174(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 50
LDI r2, 174
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
