; DESCRIPTION: Places a magenta line segment connecting (373, 50) to (467, 102).
; PLAN: r0=373(x1), r1=50(y1), r2=467(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 50
LDI r2, 467
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
