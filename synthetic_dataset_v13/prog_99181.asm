; DESCRIPTION: Renders a black line between points (344, 103) and (331, 227).
; PLAN: r0=344(x1), r1=103(y1), r2=331(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 103
LDI r2, 331
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
