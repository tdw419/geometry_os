; DESCRIPTION: Renders a orange box of size 32x53 starting at (420, 30).
; PLAN: r0=420(x), r1=30(y), r2=32(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 30
LDI r2, 32
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
