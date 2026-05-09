; DESCRIPTION: Renders a white box of size 34x14 starting at (324, 76).
; PLAN: r0=324(x), r1=76(y), r2=34(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 76
LDI r2, 34
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
