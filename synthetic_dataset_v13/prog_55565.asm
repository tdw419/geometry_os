; DESCRIPTION: Renders a orange box of size 62x15 starting at (131, 222).
; PLAN: r0=131(x), r1=222(y), r2=62(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 222
LDI r2, 62
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
