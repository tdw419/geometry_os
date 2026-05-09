; DESCRIPTION: Places a black line segment connecting (327, 109) to (283, 225).
; PLAN: r0=327(x1), r1=109(y1), r2=283(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 109
LDI r2, 283
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
