; DESCRIPTION: Places a magenta line segment connecting (109, 82) to (47, 186).
; PLAN: r0=109(x1), r1=82(y1), r2=47(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 82
LDI r2, 47
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
