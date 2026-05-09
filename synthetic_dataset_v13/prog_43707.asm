; DESCRIPTION: Renders a green line between points (164, 4) and (336, 252).
; PLAN: r0=164(x1), r1=4(y1), r2=336(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 4
LDI r2, 336
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
