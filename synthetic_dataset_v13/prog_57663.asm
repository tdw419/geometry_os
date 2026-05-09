; DESCRIPTION: Places a orange circle of radius 64 at center (154, 118).
; PLAN: r0=154(x), r1=118(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 118
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
