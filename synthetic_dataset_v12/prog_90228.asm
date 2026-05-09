; DESCRIPTION: Places a white line segment connecting (52, 197) to (432, 227).
; PLAN: r0=52(x1), r1=197(y1), r2=432(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 197
LDI r2, 432
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
