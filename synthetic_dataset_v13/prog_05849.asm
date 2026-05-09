; DESCRIPTION: Renders a green line between points (234, 243) and (115, 41).
; PLAN: r0=234(x1), r1=243(y1), r2=115(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 243
LDI r2, 115
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
