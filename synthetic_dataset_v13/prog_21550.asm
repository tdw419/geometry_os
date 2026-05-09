; DESCRIPTION: Renders a white box of size 71x34 starting at (9, 0).
; PLAN: r0=9(x), r1=0(y), r2=71(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 0
LDI r2, 71
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
