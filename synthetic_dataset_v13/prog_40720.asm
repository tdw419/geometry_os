; DESCRIPTION: Renders a white box of size 24x38 starting at (155, 68).
; PLAN: r0=155(x), r1=68(y), r2=24(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 68
LDI r2, 24
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
