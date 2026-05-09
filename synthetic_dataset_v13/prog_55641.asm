; DESCRIPTION: Places a red line segment connecting (41, 128) to (135, 140).
; PLAN: r0=41(x1), r1=128(y1), r2=135(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 128
LDI r2, 135
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
