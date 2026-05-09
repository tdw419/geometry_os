; DESCRIPTION: Places a black line segment connecting (167, 31) to (409, 132).
; PLAN: r0=167(x1), r1=31(y1), r2=409(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 31
LDI r2, 409
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
