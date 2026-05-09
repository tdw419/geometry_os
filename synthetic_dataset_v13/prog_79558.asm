; DESCRIPTION: Renders a orange line between points (251, 18) and (315, 210).
; PLAN: r0=251(x1), r1=18(y1), r2=315(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 18
LDI r2, 315
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
