; DESCRIPTION: Places a black line segment connecting (260, 241) to (334, 27).
; PLAN: r0=260(x1), r1=241(y1), r2=334(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 241
LDI r2, 334
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
