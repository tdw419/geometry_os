; DESCRIPTION: Renders a orange box of size 26x42 starting at (61, 64).
; PLAN: r0=61(x), r1=64(y), r2=26(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 64
LDI r2, 26
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
