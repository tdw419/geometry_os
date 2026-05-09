; DESCRIPTION: Places a red line segment connecting (365, 33) to (369, 32).
; PLAN: r0=365(x1), r1=33(y1), r2=369(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 33
LDI r2, 369
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
