; DESCRIPTION: Renders a cyan line between points (6, 72) and (361, 97).
; PLAN: r0=6(x1), r1=72(y1), r2=361(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 72
LDI r2, 361
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
