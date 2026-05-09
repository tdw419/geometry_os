; DESCRIPTION: Renders a white box of size 24x78 starting at (382, 137).
; PLAN: r0=382(x), r1=137(y), r2=24(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 137
LDI r2, 24
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
