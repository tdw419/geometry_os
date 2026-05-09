; DESCRIPTION: Renders a red box of size 38x100 starting at (375, 130).
; PLAN: r0=375(x), r1=130(y), r2=38(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 130
LDI r2, 38
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
