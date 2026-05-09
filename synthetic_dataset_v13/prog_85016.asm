; DESCRIPTION: Places a green line segment connecting (102, 159) to (210, 155).
; PLAN: r0=102(x1), r1=159(y1), r2=210(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 159
LDI r2, 210
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
