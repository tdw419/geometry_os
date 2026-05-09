; DESCRIPTION: Places a orange circle of radius 42 at center (373, 106).
; PLAN: r0=373(x), r1=106(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 106
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
