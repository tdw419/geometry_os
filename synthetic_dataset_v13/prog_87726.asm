; DESCRIPTION: Renders a white box of size 19x37 starting at (234, 24).
; PLAN: r0=234(x), r1=24(y), r2=19(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 24
LDI r2, 19
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
