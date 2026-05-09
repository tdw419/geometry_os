; DESCRIPTION: Renders a cyan line between points (374, 36) and (211, 158).
; PLAN: r0=374(x1), r1=36(y1), r2=211(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 36
LDI r2, 211
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
