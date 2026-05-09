; DESCRIPTION: Renders a orange box of size 81x101 starting at (403, 81).
; PLAN: r0=403(x), r1=81(y), r2=81(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 81
LDI r2, 81
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
