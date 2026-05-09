; DESCRIPTION: Renders a orange line between points (85, 153) and (460, 172).
; PLAN: r0=85(x1), r1=153(y1), r2=460(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 153
LDI r2, 460
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
