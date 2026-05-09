; DESCRIPTION: Renders a cyan line between points (323, 105) and (8, 176).
; PLAN: r0=323(x1), r1=105(y1), r2=8(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 105
LDI r2, 8
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
