; DESCRIPTION: Renders a orange box of size 43x98 starting at (219, 55).
; PLAN: r0=219(x), r1=55(y), r2=43(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 55
LDI r2, 43
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
