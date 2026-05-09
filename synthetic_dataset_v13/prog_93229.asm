; DESCRIPTION: Creates a blue circular shape at (171, 212) with radius 42.
; PLAN: r0=171(x), r1=212(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 212
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
