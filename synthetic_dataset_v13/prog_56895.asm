; DESCRIPTION: Renders a black line between points (334, 249) and (64, 48).
; PLAN: r0=334(x1), r1=249(y1), r2=64(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 249
LDI r2, 64
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
