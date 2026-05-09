; DESCRIPTION: Renders a orange line between points (103, 164) and (374, 247).
; PLAN: r0=103(x1), r1=164(y1), r2=374(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 164
LDI r2, 374
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
