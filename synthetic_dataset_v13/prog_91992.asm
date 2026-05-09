; DESCRIPTION: Renders a orange box of size 72x35 starting at (148, 176).
; PLAN: r0=148(x), r1=176(y), r2=72(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 176
LDI r2, 72
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
