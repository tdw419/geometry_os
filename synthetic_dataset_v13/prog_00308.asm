; DESCRIPTION: Places a red line segment connecting (204, 46) to (333, 100).
; PLAN: r0=204(x1), r1=46(y1), r2=333(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 46
LDI r2, 333
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
