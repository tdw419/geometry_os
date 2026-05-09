; DESCRIPTION: Places a orange circle of radius 50 at center (224, 118).
; PLAN: r0=224(x), r1=118(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 118
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
