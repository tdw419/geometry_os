; DESCRIPTION: Renders a orange line between points (113, 237) and (435, 4).
; PLAN: r0=113(x1), r1=237(y1), r2=435(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 237
LDI r2, 435
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
