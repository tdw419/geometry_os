; DESCRIPTION: Renders a orange line between points (45, 149) and (361, 173).
; PLAN: r0=45(x1), r1=149(y1), r2=361(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 149
LDI r2, 361
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
