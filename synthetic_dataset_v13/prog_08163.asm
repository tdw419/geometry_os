; DESCRIPTION: Renders a orange box of size 64x19 starting at (376, 194).
; PLAN: r0=376(x), r1=194(y), r2=64(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 194
LDI r2, 64
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
