; DESCRIPTION: Renders a cyan line between points (15, 66) and (358, 90).
; PLAN: r0=15(x1), r1=66(y1), r2=358(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 66
LDI r2, 358
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
