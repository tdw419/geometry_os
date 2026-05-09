; DESCRIPTION: Renders a white box of size 62x38 starting at (158, 161).
; PLAN: r0=158(x), r1=161(y), r2=62(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 161
LDI r2, 62
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
