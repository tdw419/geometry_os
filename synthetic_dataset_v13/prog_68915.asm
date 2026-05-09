; DESCRIPTION: Places a red line segment connecting (247, 188) to (4, 14).
; PLAN: r0=247(x1), r1=188(y1), r2=4(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 188
LDI r2, 4
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
