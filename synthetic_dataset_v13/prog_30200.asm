; DESCRIPTION: Renders a orange line between points (446, 48) and (282, 68).
; PLAN: r0=446(x1), r1=48(y1), r2=282(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 48
LDI r2, 282
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
