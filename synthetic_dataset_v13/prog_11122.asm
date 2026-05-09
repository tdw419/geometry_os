; DESCRIPTION: Places a magenta line segment connecting (410, 199) to (248, 50).
; PLAN: r0=410(x1), r1=199(y1), r2=248(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 199
LDI r2, 248
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
