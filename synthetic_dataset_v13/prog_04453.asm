; DESCRIPTION: Renders a yellow box of size 12x107 starting at (83, 131).
; PLAN: r0=83(x), r1=131(y), r2=12(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 131
LDI r2, 12
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
