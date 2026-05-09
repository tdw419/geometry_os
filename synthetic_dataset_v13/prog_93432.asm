; DESCRIPTION: Places a red line segment connecting (416, 65) to (148, 214).
; PLAN: r0=416(x1), r1=65(y1), r2=148(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 65
LDI r2, 148
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
