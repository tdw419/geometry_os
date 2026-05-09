; DESCRIPTION: Renders a black line between points (399, 163) and (445, 136).
; PLAN: r0=399(x1), r1=163(y1), r2=445(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 163
LDI r2, 445
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
