; DESCRIPTION: Renders a cyan line between points (427, 90) and (402, 252).
; PLAN: r0=427(x1), r1=90(y1), r2=402(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 90
LDI r2, 402
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
