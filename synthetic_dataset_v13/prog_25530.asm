; DESCRIPTION: Renders a orange line between points (442, 214) and (374, 201).
; PLAN: r0=442(x1), r1=214(y1), r2=374(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 214
LDI r2, 374
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
