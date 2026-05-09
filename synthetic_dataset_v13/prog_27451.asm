; DESCRIPTION: Renders a cyan line between points (443, 101) and (433, 245).
; PLAN: r0=443(x1), r1=101(y1), r2=433(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 101
LDI r2, 433
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
