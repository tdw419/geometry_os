; DESCRIPTION: Places a red line segment connecting (478, 152) to (161, 118).
; PLAN: r0=478(x1), r1=152(y1), r2=161(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 152
LDI r2, 161
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
