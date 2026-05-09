; DESCRIPTION: Renders a orange line between points (401, 90) and (505, 199).
; PLAN: r0=401(x1), r1=90(y1), r2=505(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 90
LDI r2, 505
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
