; DESCRIPTION: Places a green line segment connecting (171, 105) to (274, 24).
; PLAN: r0=171(x1), r1=105(y1), r2=274(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 105
LDI r2, 274
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
