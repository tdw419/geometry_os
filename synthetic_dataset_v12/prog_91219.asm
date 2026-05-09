; DESCRIPTION: Renders a orange line between points (300, 0) and (434, 238).
; PLAN: r0=300(x1), r1=0(y1), r2=434(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 0
LDI r2, 434
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
