; DESCRIPTION: Renders a yellow line between points (92, 91) and (402, 252).
; PLAN: r0=92(x1), r1=91(y1), r2=402(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 91
LDI r2, 402
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
