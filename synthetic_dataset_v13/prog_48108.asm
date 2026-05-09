; DESCRIPTION: Places a red line segment connecting (160, 41) to (148, 43).
; PLAN: r0=160(x1), r1=41(y1), r2=148(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 41
LDI r2, 148
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
