; DESCRIPTION: Renders a cyan line between points (414, 245) and (159, 85).
; PLAN: r0=414(x1), r1=245(y1), r2=159(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 245
LDI r2, 159
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
