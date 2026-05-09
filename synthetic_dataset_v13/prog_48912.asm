; DESCRIPTION: Renders a green line between points (427, 53) and (294, 41).
; PLAN: r0=427(x1), r1=53(y1), r2=294(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 53
LDI r2, 294
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
