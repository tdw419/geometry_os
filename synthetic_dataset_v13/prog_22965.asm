; DESCRIPTION: Places a yellow line segment connecting (486, 5) to (69, 172).
; PLAN: r0=486(x1), r1=5(y1), r2=69(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 5
LDI r2, 69
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
