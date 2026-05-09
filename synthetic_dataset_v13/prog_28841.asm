; DESCRIPTION: Renders a red disk with center (433, 78) and radius 32.
; PLAN: r0=433(x), r1=78(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 78
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
