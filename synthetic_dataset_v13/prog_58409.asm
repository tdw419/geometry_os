; DESCRIPTION: Renders a orange box of size 77x108 starting at (219, 40).
; PLAN: r0=219(x), r1=40(y), r2=77(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 40
LDI r2, 77
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
