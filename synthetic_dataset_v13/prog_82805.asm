; DESCRIPTION: Renders a cyan line between points (417, 109) and (85, 245).
; PLAN: r0=417(x1), r1=109(y1), r2=85(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 109
LDI r2, 85
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
