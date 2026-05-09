; DESCRIPTION: Renders a red line between points (254, 167) and (402, 157).
; PLAN: r0=254(x1), r1=167(y1), r2=402(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 167
LDI r2, 402
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
