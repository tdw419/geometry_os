; DESCRIPTION: Renders a black line between points (60, 48) and (299, 157).
; PLAN: r0=60(x1), r1=48(y1), r2=299(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 48
LDI r2, 299
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
