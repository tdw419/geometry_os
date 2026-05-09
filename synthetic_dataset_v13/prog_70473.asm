; DESCRIPTION: Places a magenta line segment connecting (364, 220) to (467, 47).
; PLAN: r0=364(x1), r1=220(y1), r2=467(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 220
LDI r2, 467
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
