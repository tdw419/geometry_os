; DESCRIPTION: Renders a green box of size 100x24 starting at (405, 45).
; PLAN: r0=405(x), r1=45(y), r2=100(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 45
LDI r2, 100
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
