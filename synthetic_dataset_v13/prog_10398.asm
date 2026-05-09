; DESCRIPTION: Places a red line segment connecting (271, 158) to (400, 178).
; PLAN: r0=271(x1), r1=158(y1), r2=400(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 158
LDI r2, 400
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
