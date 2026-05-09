; DESCRIPTION: Renders a green line between points (483, 241) and (280, 179).
; PLAN: r0=483(x1), r1=241(y1), r2=280(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 241
LDI r2, 280
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
