; DESCRIPTION: Renders a orange line between points (256, 60) and (40, 39).
; PLAN: r0=256(x1), r1=60(y1), r2=40(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 60
LDI r2, 40
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
