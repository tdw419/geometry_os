; DESCRIPTION: Renders a orange line between points (161, 61) and (255, 8).
; PLAN: r0=161(x1), r1=61(y1), r2=255(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 61
LDI r2, 255
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
