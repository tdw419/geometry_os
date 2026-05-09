; DESCRIPTION: Places a green line segment connecting (252, 108) to (171, 2).
; PLAN: r0=252(x1), r1=108(y1), r2=171(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 108
LDI r2, 171
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
