; DESCRIPTION: Renders a orange box of size 32x35 starting at (192, 139).
; PLAN: r0=192(x), r1=139(y), r2=32(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 139
LDI r2, 32
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
