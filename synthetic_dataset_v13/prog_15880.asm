; DESCRIPTION: Places a green line segment connecting (462, 2) to (61, 171).
; PLAN: r0=462(x1), r1=2(y1), r2=61(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 2
LDI r2, 61
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
