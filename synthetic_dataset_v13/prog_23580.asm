; DESCRIPTION: Renders a cyan line between points (507, 87) and (72, 245).
; PLAN: r0=507(x1), r1=87(y1), r2=72(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 87
LDI r2, 72
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
