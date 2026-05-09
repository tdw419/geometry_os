; DESCRIPTION: Places a orange circle of radius 22 at center (372, 42).
; PLAN: r0=372(x), r1=42(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 42
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
