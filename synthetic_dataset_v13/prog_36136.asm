; DESCRIPTION: Renders a orange box of size 23x99 starting at (19, 155).
; PLAN: r0=19(x), r1=155(y), r2=23(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 155
LDI r2, 23
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
