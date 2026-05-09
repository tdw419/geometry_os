; DESCRIPTION: Renders a orange line between points (135, 98) and (8, 14).
; PLAN: r0=135(x1), r1=98(y1), r2=8(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 98
LDI r2, 8
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
