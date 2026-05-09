; DESCRIPTION: Renders a red box of size 91x28 starting at (26, 60).
; PLAN: r0=26(x), r1=60(y), r2=91(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 60
LDI r2, 91
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
