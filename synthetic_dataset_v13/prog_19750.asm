; DESCRIPTION: Renders a green line between points (483, 79) and (486, 196).
; PLAN: r0=483(x1), r1=79(y1), r2=486(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 79
LDI r2, 486
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
