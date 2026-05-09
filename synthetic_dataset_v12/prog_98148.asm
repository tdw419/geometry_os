; DESCRIPTION: Places a red line segment connecting (264, 50) to (216, 23).
; PLAN: r0=264(x1), r1=50(y1), r2=216(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 50
LDI r2, 216
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
