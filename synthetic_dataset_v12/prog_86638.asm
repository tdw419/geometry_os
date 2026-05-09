; DESCRIPTION: Renders a orange box of size 44x69 starting at (451, 15).
; PLAN: r0=451(x), r1=15(y), r2=44(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 15
LDI r2, 44
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
