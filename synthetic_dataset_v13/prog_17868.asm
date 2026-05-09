; DESCRIPTION: Renders a orange box of size 10x105 starting at (477, 116).
; PLAN: r0=477(x), r1=116(y), r2=10(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 116
LDI r2, 10
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
