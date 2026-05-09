; DESCRIPTION: Renders a yellow line between points (329, 220) and (95, 252).
; PLAN: r0=329(x1), r1=220(y1), r2=95(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 220
LDI r2, 95
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
