; DESCRIPTION: Renders a blue box of size 27x53 starting at (83, 89).
; PLAN: r0=83(x), r1=89(y), r2=27(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 89
LDI r2, 27
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
