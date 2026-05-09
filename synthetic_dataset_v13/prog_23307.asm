; DESCRIPTION: Renders a orange box of size 33x81 starting at (30, 72).
; PLAN: r0=30(x), r1=72(y), r2=33(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 72
LDI r2, 33
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
