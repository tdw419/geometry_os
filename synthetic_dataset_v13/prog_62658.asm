; DESCRIPTION: Renders a orange box of size 110x13 starting at (32, 62).
; PLAN: r0=32(x), r1=62(y), r2=110(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 62
LDI r2, 110
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
