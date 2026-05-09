; DESCRIPTION: Renders a orange box of size 85x59 starting at (62, 46).
; PLAN: r0=62(x), r1=46(y), r2=85(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 46
LDI r2, 85
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
