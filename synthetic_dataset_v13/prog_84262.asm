; DESCRIPTION: Renders a orange box of size 84x108 starting at (283, 6).
; PLAN: r0=283(x), r1=6(y), r2=84(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 6
LDI r2, 84
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
