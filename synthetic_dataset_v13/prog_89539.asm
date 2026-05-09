; DESCRIPTION: Renders a orange line between points (397, 134) and (220, 24).
; PLAN: r0=397(x1), r1=134(y1), r2=220(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 134
LDI r2, 220
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
