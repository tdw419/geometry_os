; DESCRIPTION: Renders a orange box of size 119x62 starting at (274, 120).
; PLAN: r0=274(x), r1=120(y), r2=119(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 120
LDI r2, 119
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
