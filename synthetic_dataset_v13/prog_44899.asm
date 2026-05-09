; DESCRIPTION: Renders a green line between points (118, 27) and (378, 208).
; PLAN: r0=118(x1), r1=27(y1), r2=378(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 27
LDI r2, 378
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
