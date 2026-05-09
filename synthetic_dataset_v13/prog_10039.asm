; DESCRIPTION: Places a red line segment connecting (409, 198) to (187, 48).
; PLAN: r0=409(x1), r1=198(y1), r2=187(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 198
LDI r2, 187
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
