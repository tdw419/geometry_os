; DESCRIPTION: Renders a orange box of size 55x66 starting at (266, 121).
; PLAN: r0=266(x), r1=121(y), r2=55(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 121
LDI r2, 55
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
