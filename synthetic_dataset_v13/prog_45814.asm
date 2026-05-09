; DESCRIPTION: Places a red line segment connecting (400, 50) to (33, 35).
; PLAN: r0=400(x1), r1=50(y1), r2=33(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 50
LDI r2, 33
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
