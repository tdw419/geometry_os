; DESCRIPTION: Places a red line segment connecting (119, 138) to (313, 107).
; PLAN: r0=119(x1), r1=138(y1), r2=313(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 138
LDI r2, 313
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
