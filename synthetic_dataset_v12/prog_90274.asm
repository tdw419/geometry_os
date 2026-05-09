; DESCRIPTION: Places a red line segment connecting (80, 153) to (217, 50).
; PLAN: r0=80(x1), r1=153(y1), r2=217(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 153
LDI r2, 217
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
