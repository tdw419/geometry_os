; DESCRIPTION: Places a green line segment connecting (366, 171) to (111, 15).
; PLAN: r0=366(x1), r1=171(y1), r2=111(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 171
LDI r2, 111
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
