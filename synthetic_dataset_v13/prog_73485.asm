; DESCRIPTION: Renders a black line between points (109, 220) and (86, 247).
; PLAN: r0=109(x1), r1=220(y1), r2=86(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 220
LDI r2, 86
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
