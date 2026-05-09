; DESCRIPTION: Renders a orange box of size 83x20 starting at (292, 100).
; PLAN: r0=292(x), r1=100(y), r2=83(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 100
LDI r2, 83
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
