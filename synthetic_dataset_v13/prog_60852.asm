; DESCRIPTION: Places a black line segment connecting (275, 241) to (176, 52).
; PLAN: r0=275(x1), r1=241(y1), r2=176(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 241
LDI r2, 176
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
