; DESCRIPTION: Places a green line segment connecting (283, 186) to (491, 233).
; PLAN: r0=283(x1), r1=186(y1), r2=491(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 186
LDI r2, 491
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
