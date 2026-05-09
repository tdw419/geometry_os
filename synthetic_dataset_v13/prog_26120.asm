; DESCRIPTION: Places a green line segment connecting (486, 157) to (81, 164).
; PLAN: r0=486(x1), r1=157(y1), r2=81(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 157
LDI r2, 81
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
