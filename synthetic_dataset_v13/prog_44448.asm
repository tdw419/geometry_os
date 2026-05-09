; DESCRIPTION: Renders a black line between points (101, 96) and (356, 61).
; PLAN: r0=101(x1), r1=96(y1), r2=356(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 96
LDI r2, 356
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
