; DESCRIPTION: Places a red line segment connecting (409, 189) to (134, 127).
; PLAN: r0=409(x1), r1=189(y1), r2=134(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 189
LDI r2, 134
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
