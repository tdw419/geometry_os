; DESCRIPTION: Renders a orange box of size 55x22 starting at (105, 189).
; PLAN: r0=105(x), r1=189(y), r2=55(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 189
LDI r2, 55
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
