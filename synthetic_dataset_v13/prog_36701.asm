; DESCRIPTION: Renders a white box of size 82x82 starting at (232, 129).
; PLAN: r0=232(x), r1=129(y), r2=82(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 129
LDI r2, 82
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
