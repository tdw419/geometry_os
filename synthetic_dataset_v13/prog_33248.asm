; DESCRIPTION: Renders a cyan line between points (374, 169) and (318, 42).
; PLAN: r0=374(x1), r1=169(y1), r2=318(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 169
LDI r2, 318
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
