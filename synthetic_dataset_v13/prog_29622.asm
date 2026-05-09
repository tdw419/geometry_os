; DESCRIPTION: Renders a black line between points (54, 196) and (485, 183).
; PLAN: r0=54(x1), r1=196(y1), r2=485(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 196
LDI r2, 485
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
