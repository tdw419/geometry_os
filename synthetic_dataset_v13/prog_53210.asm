; DESCRIPTION: Renders a white box of size 62x39 starting at (219, 50).
; PLAN: r0=219(x), r1=50(y), r2=62(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 50
LDI r2, 62
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
