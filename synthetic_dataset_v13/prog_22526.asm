; DESCRIPTION: Renders a orange line between points (43, 71) and (187, 250).
; PLAN: r0=43(x1), r1=71(y1), r2=187(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 71
LDI r2, 187
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
