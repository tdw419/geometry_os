; DESCRIPTION: Renders a orange box of size 100x30 starting at (336, 181).
; PLAN: r0=336(x), r1=181(y), r2=100(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 181
LDI r2, 100
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
