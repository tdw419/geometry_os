; DESCRIPTION: Places a green line segment connecting (12, 171) to (182, 35).
; PLAN: r0=12(x1), r1=171(y1), r2=182(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 171
LDI r2, 182
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
