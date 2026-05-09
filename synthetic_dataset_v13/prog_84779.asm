; DESCRIPTION: Renders a orange line between points (243, 42) and (359, 4).
; PLAN: r0=243(x1), r1=42(y1), r2=359(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 42
LDI r2, 359
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
