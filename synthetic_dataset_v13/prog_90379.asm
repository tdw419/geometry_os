; DESCRIPTION: Renders a white line between points (421, 19) and (388, 219).
; PLAN: r0=421(x1), r1=19(y1), r2=388(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 19
LDI r2, 388
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
