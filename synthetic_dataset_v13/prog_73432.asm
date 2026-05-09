; DESCRIPTION: Renders a cyan line between points (457, 211) and (41, 81).
; PLAN: r0=457(x1), r1=211(y1), r2=41(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 211
LDI r2, 41
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
