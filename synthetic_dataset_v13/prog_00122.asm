; DESCRIPTION: Renders a orange line between points (361, 164) and (10, 255).
; PLAN: r0=361(x1), r1=164(y1), r2=10(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 164
LDI r2, 10
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
