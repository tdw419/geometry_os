; DESCRIPTION: Draws a white line from (374, 123) to (109, 76).
; PLAN: r0=374(x1), r1=123(y1), r2=109(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 123
LDI r2, 109
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
