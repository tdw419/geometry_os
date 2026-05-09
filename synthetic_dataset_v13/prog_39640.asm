; DESCRIPTION: Renders a orange line between points (286, 96) and (499, 37).
; PLAN: r0=286(x1), r1=96(y1), r2=499(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 96
LDI r2, 499
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
