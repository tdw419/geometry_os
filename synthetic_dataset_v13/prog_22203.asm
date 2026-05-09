; DESCRIPTION: Renders a white box of size 72x31 starting at (155, 193).
; PLAN: r0=155(x), r1=193(y), r2=72(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 193
LDI r2, 72
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
