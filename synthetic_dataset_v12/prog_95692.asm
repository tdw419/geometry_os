; DESCRIPTION: Places a green line segment connecting (454, 171) to (507, 171).
; PLAN: r0=454(x1), r1=171(y1), r2=507(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 171
LDI r2, 507
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
