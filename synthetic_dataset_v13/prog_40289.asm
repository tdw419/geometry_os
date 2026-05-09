; DESCRIPTION: Renders a orange line between points (116, 209) and (370, 79).
; PLAN: r0=116(x1), r1=209(y1), r2=370(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 209
LDI r2, 370
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
