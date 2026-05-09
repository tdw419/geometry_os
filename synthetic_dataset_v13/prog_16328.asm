; DESCRIPTION: Renders a white box of size 33x82 starting at (283, 49).
; PLAN: r0=283(x), r1=49(y), r2=33(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 49
LDI r2, 33
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
