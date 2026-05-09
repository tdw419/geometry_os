; DESCRIPTION: Renders a orange box of size 32x50 starting at (203, 53).
; PLAN: r0=203(x), r1=53(y), r2=32(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 53
LDI r2, 32
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
