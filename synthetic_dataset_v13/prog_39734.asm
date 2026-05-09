; DESCRIPTION: Renders a orange line between points (276, 247) and (487, 90).
; PLAN: r0=276(x1), r1=247(y1), r2=487(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 247
LDI r2, 487
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
