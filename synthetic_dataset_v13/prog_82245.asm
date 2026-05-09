; DESCRIPTION: Renders a white box of size 40x82 starting at (414, 31).
; PLAN: r0=414(x), r1=31(y), r2=40(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 31
LDI r2, 40
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
