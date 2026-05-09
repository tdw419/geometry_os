; DESCRIPTION: Renders a orange line between points (455, 223) and (365, 30).
; PLAN: r0=455(x1), r1=223(y1), r2=365(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 223
LDI r2, 365
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
