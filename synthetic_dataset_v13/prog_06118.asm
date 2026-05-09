; DESCRIPTION: Renders a black line between points (247, 92) and (356, 9).
; PLAN: r0=247(x1), r1=92(y1), r2=356(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 92
LDI r2, 356
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
