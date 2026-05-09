; DESCRIPTION: Renders a orange box of size 93x81 starting at (270, 128).
; PLAN: r0=270(x), r1=128(y), r2=93(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 128
LDI r2, 93
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
