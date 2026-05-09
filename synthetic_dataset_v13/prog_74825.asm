; DESCRIPTION: Renders a orange line between points (287, 130) and (273, 167).
; PLAN: r0=287(x1), r1=130(y1), r2=273(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 130
LDI r2, 273
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
