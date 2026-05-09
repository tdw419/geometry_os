; DESCRIPTION: Renders a orange box of size 32x120 starting at (461, 15).
; PLAN: r0=461(x), r1=15(y), r2=32(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 15
LDI r2, 32
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
