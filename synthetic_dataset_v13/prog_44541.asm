; DESCRIPTION: Renders a yellow line between points (41, 234) and (64, 52).
; PLAN: r0=41(x1), r1=234(y1), r2=64(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 234
LDI r2, 64
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
