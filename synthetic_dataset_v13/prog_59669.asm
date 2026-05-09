; DESCRIPTION: Renders a green line between points (212, 86) and (104, 252).
; PLAN: r0=212(x1), r1=86(y1), r2=104(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 86
LDI r2, 104
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
