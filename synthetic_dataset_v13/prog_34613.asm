; DESCRIPTION: Renders a cyan line between points (426, 34) and (8, 105).
; PLAN: r0=426(x1), r1=34(y1), r2=8(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 34
LDI r2, 8
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
