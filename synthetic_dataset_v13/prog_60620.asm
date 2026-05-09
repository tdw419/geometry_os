; DESCRIPTION: Renders a orange line between points (202, 90) and (24, 60).
; PLAN: r0=202(x1), r1=90(y1), r2=24(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 90
LDI r2, 24
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
