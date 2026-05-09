; DESCRIPTION: Renders a cyan line between points (32, 81) and (471, 97).
; PLAN: r0=32(x1), r1=81(y1), r2=471(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 81
LDI r2, 471
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
