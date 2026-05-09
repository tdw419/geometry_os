; DESCRIPTION: Renders a white line between points (366, 160) and (331, 239).
; PLAN: r0=366(x1), r1=160(y1), r2=331(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 160
LDI r2, 331
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
