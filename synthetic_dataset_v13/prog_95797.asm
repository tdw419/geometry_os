; DESCRIPTION: Renders a cyan line between points (93, 156) and (329, 99).
; PLAN: r0=93(x1), r1=156(y1), r2=329(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 156
LDI r2, 329
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
