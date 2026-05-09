; DESCRIPTION: Renders a cyan line between points (37, 45) and (374, 245).
; PLAN: r0=37(x1), r1=45(y1), r2=374(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 45
LDI r2, 374
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
