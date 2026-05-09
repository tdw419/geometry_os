; DESCRIPTION: Renders a white box of size 24x62 starting at (26, 64).
; PLAN: r0=26(x), r1=64(y), r2=24(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 64
LDI r2, 24
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
