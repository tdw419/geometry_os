; DESCRIPTION: Places a green line segment connecting (164, 3) to (367, 118).
; PLAN: r0=164(x1), r1=3(y1), r2=367(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 3
LDI r2, 367
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
