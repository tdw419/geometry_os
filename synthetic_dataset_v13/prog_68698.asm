; DESCRIPTION: Places a black line segment connecting (402, 173) to (399, 57).
; PLAN: r0=402(x1), r1=173(y1), r2=399(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 173
LDI r2, 399
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
