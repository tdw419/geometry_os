; DESCRIPTION: Places a yellow line segment connecting (251, 69) to (467, 92).
; PLAN: r0=251(x1), r1=69(y1), r2=467(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 69
LDI r2, 467
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
