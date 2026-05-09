; DESCRIPTION: Renders a cyan line between points (343, 208) and (28, 97).
; PLAN: r0=343(x1), r1=208(y1), r2=28(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 208
LDI r2, 28
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
