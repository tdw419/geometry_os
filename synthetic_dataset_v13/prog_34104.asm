; DESCRIPTION: Renders a orange box of size 16x83 starting at (52, 151).
; PLAN: r0=52(x), r1=151(y), r2=16(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 151
LDI r2, 16
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
