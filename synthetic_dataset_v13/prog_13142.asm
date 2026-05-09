; DESCRIPTION: Renders a orange box of size 100x67 starting at (219, 32).
; PLAN: r0=219(x), r1=32(y), r2=100(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 32
LDI r2, 100
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
