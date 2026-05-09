; DESCRIPTION: Places a magenta line segment connecting (436, 47) to (311, 39).
; PLAN: r0=436(x1), r1=47(y1), r2=311(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 47
LDI r2, 311
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
