; DESCRIPTION: Renders a orange box of size 59x108 starting at (0, 31).
; PLAN: r0=0(x), r1=31(y), r2=59(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 31
LDI r2, 59
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
