; DESCRIPTION: Renders a magenta line between points (306, 15) and (491, 239).
; PLAN: r0=306(x1), r1=15(y1), r2=491(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 15
LDI r2, 491
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
