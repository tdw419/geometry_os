; DESCRIPTION: Renders a white box of size 62x29 starting at (359, 161).
; PLAN: r0=359(x), r1=161(y), r2=62(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 161
LDI r2, 62
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
