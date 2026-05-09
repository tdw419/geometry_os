; DESCRIPTION: Renders a orange line between points (262, 1) and (178, 24).
; PLAN: r0=262(x1), r1=1(y1), r2=178(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 1
LDI r2, 178
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
