; DESCRIPTION: Renders a orange line between points (106, 249) and (18, 255).
; PLAN: r0=106(x1), r1=249(y1), r2=18(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 249
LDI r2, 18
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
