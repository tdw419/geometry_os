; DESCRIPTION: Renders a orange line between points (487, 27) and (13, 13).
; PLAN: r0=487(x1), r1=27(y1), r2=13(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 27
LDI r2, 13
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
