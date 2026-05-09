; DESCRIPTION: Places a black line segment connecting (409, 132) to (167, 159).
; PLAN: r0=409(x1), r1=132(y1), r2=167(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 132
LDI r2, 167
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
