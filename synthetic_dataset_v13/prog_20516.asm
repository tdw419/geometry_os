; DESCRIPTION: Renders a orange box of size 55x101 starting at (63, 115).
; PLAN: r0=63(x), r1=115(y), r2=55(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 115
LDI r2, 55
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
