; DESCRIPTION: Draws a orange line from (487, 216) to (240, 82).
; PLAN: r0=487(x1), r1=216(y1), r2=240(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 216
LDI r2, 240
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
