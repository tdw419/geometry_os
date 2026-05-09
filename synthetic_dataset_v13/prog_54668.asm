; DESCRIPTION: Renders a orange line between points (224, 60) and (397, 120).
; PLAN: r0=224(x1), r1=60(y1), r2=397(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 60
LDI r2, 397
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
