; DESCRIPTION: Places a green line segment connecting (366, 172) to (51, 24).
; PLAN: r0=366(x1), r1=172(y1), r2=51(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 172
LDI r2, 51
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
