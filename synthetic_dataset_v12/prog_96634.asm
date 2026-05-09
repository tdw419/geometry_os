; DESCRIPTION: Places a red line segment connecting (169, 248) to (400, 253).
; PLAN: r0=169(x1), r1=248(y1), r2=400(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 248
LDI r2, 400
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
