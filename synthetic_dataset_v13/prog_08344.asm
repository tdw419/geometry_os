; DESCRIPTION: Renders a orange line between points (61, 21) and (38, 255).
; PLAN: r0=61(x1), r1=21(y1), r2=38(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 21
LDI r2, 38
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
