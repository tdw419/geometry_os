; DESCRIPTION: Renders a cyan line between points (93, 83) and (63, 86).
; PLAN: r0=93(x1), r1=83(y1), r2=63(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 83
LDI r2, 63
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
