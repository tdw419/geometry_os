; DESCRIPTION: Places a black line segment connecting (220, 196) to (430, 83).
; PLAN: r0=220(x1), r1=196(y1), r2=430(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 196
LDI r2, 430
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
