; DESCRIPTION: Renders a green box of size 23x119 starting at (429, 32).
; PLAN: r0=429(x), r1=32(y), r2=23(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 32
LDI r2, 23
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
