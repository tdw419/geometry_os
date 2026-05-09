; DESCRIPTION: Renders a orange line between points (464, 130) and (263, 18).
; PLAN: r0=464(x1), r1=130(y1), r2=263(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 130
LDI r2, 263
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
