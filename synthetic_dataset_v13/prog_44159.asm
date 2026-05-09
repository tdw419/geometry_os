; DESCRIPTION: Renders a green line between points (483, 124) and (8, 40).
; PLAN: r0=483(x1), r1=124(y1), r2=8(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 124
LDI r2, 8
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
