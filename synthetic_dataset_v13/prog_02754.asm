; DESCRIPTION: Renders a orange line between points (125, 32) and (296, 240).
; PLAN: r0=125(x1), r1=32(y1), r2=296(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 32
LDI r2, 296
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
