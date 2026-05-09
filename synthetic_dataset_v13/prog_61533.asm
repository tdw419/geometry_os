; DESCRIPTION: Renders a orange line between points (427, 124) and (255, 146).
; PLAN: r0=427(x1), r1=124(y1), r2=255(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 124
LDI r2, 255
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
