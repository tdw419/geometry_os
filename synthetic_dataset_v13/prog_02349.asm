; DESCRIPTION: Renders a orange box of size 36x67 starting at (282, 116).
; PLAN: r0=282(x), r1=116(y), r2=36(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 116
LDI r2, 36
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
