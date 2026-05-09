; DESCRIPTION: Renders a orange line between points (352, 5) and (180, 251).
; PLAN: r0=352(x1), r1=5(y1), r2=180(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 5
LDI r2, 180
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
