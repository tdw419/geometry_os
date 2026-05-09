; DESCRIPTION: Renders a green line between points (381, 184) and (48, 252).
; PLAN: r0=381(x1), r1=184(y1), r2=48(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 184
LDI r2, 48
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
