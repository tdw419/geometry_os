; DESCRIPTION: Renders a cyan line between points (477, 3) and (52, 203).
; PLAN: r0=477(x1), r1=3(y1), r2=52(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 3
LDI r2, 52
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
