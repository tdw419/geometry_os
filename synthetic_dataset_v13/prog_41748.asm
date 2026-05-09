; DESCRIPTION: Renders a green box of size 87x31 starting at (159, 131).
; PLAN: r0=159(x), r1=131(y), r2=87(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 131
LDI r2, 87
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
