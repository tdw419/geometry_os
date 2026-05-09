; DESCRIPTION: Renders a cyan line between points (496, 44) and (119, 208).
; PLAN: r0=496(x1), r1=44(y1), r2=119(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 44
LDI r2, 119
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
