; DESCRIPTION: Renders a cyan line between points (115, 114) and (250, 52).
; PLAN: r0=115(x1), r1=114(y1), r2=250(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 114
LDI r2, 250
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
