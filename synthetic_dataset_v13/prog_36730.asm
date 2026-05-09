; DESCRIPTION: Renders a orange line between points (222, 209) and (91, 204).
; PLAN: r0=222(x1), r1=209(y1), r2=91(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 209
LDI r2, 91
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
