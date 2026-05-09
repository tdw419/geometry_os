; DESCRIPTION: Renders a orange line between points (406, 18) and (450, 206).
; PLAN: r0=406(x1), r1=18(y1), r2=450(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 18
LDI r2, 450
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
