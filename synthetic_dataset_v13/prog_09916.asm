; DESCRIPTION: Renders a orange line between points (509, 168) and (244, 57).
; PLAN: r0=509(x1), r1=168(y1), r2=244(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 168
LDI r2, 244
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
