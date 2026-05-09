; DESCRIPTION: Renders a orange box of size 33x23 starting at (181, 166).
; PLAN: r0=181(x), r1=166(y), r2=33(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 166
LDI r2, 33
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
