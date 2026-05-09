; DESCRIPTION: Renders a orange line between points (244, 179) and (278, 27).
; PLAN: r0=244(x1), r1=179(y1), r2=278(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 179
LDI r2, 278
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
