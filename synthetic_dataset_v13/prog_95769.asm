; DESCRIPTION: Renders a yellow line between points (265, 41) and (330, 206).
; PLAN: r0=265(x1), r1=41(y1), r2=330(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 41
LDI r2, 330
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
