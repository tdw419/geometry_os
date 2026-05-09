; DESCRIPTION: Renders a orange line between points (50, 125) and (460, 193).
; PLAN: r0=50(x1), r1=125(y1), r2=460(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 125
LDI r2, 460
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
