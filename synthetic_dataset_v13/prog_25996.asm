; DESCRIPTION: Renders a orange line between points (299, 145) and (295, 17).
; PLAN: r0=299(x1), r1=145(y1), r2=295(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 145
LDI r2, 295
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
