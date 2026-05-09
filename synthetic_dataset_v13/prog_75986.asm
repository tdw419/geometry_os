; DESCRIPTION: Renders a white box of size 65x81 starting at (49, 34).
; PLAN: r0=49(x), r1=34(y), r2=65(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 34
LDI r2, 65
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
