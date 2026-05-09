; DESCRIPTION: Renders a orange box of size 96x56 starting at (137, 76).
; PLAN: r0=137(x), r1=76(y), r2=96(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 76
LDI r2, 96
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
