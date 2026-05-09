; DESCRIPTION: Places a orange line segment connecting (268, 16) to (487, 93).
; PLAN: r0=268(x1), r1=16(y1), r2=487(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 16
LDI r2, 487
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
