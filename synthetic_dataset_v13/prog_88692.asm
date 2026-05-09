; DESCRIPTION: Places a red line segment connecting (135, 249) to (15, 247).
; PLAN: r0=135(x1), r1=249(y1), r2=15(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 249
LDI r2, 15
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
