; DESCRIPTION: Renders a cyan line between points (219, 4) and (427, 130).
; PLAN: r0=219(x1), r1=4(y1), r2=427(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 4
LDI r2, 427
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
