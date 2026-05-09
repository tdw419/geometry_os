; DESCRIPTION: Renders a orange line between points (375, 195) and (98, 67).
; PLAN: r0=375(x1), r1=195(y1), r2=98(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 195
LDI r2, 98
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
