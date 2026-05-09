; DESCRIPTION: Renders a orange line between points (370, 235) and (151, 139).
; PLAN: r0=370(x1), r1=235(y1), r2=151(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 235
LDI r2, 151
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
