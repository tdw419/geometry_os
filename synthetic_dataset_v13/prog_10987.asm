; DESCRIPTION: Renders a orange box of size 108x11 starting at (40, 92).
; PLAN: r0=40(x), r1=92(y), r2=108(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 92
LDI r2, 108
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
