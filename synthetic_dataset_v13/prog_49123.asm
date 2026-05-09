; DESCRIPTION: Places a red line segment connecting (149, 105) to (284, 62).
; PLAN: r0=149(x1), r1=105(y1), r2=284(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 105
LDI r2, 284
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
