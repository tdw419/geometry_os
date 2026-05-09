; DESCRIPTION: Renders a green box of size 100x29 starting at (309, 131).
; PLAN: r0=309(x), r1=131(y), r2=100(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 131
LDI r2, 100
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
