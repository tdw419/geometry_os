; DESCRIPTION: Renders a orange line between points (217, 35) and (317, 193).
; PLAN: r0=217(x1), r1=35(y1), r2=317(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 35
LDI r2, 317
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
