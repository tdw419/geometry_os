; DESCRIPTION: Renders a orange line between points (334, 255) and (187, 255).
; PLAN: r0=334(x1), r1=255(y1), r2=187(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 255
LDI r2, 187
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
