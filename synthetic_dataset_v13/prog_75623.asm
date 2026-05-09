; DESCRIPTION: Renders a orange line between points (460, 94) and (100, 177).
; PLAN: r0=460(x1), r1=94(y1), r2=100(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 94
LDI r2, 100
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
