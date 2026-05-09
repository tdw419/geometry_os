; DESCRIPTION: Renders a orange line between points (372, 45) and (224, 35).
; PLAN: r0=372(x1), r1=45(y1), r2=224(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 45
LDI r2, 224
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
