; DESCRIPTION: Renders a orange line between points (487, 48) and (285, 161).
; PLAN: r0=487(x1), r1=48(y1), r2=285(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 48
LDI r2, 285
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
