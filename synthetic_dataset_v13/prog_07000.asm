; DESCRIPTION: Renders a orange line between points (445, 27) and (65, 201).
; PLAN: r0=445(x1), r1=27(y1), r2=65(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 27
LDI r2, 65
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
