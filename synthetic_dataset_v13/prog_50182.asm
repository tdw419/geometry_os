; DESCRIPTION: Renders a white box of size 34x36 starting at (28, 100).
; PLAN: r0=28(x), r1=100(y), r2=34(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 100
LDI r2, 34
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
