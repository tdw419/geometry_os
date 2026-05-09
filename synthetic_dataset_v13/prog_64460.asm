; DESCRIPTION: Renders a cyan line between points (115, 28) and (22, 158).
; PLAN: r0=115(x1), r1=28(y1), r2=22(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 28
LDI r2, 22
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
