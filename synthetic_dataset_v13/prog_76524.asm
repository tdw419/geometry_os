; DESCRIPTION: Renders a orange box of size 90x26 starting at (56, 2).
; PLAN: r0=56(x), r1=2(y), r2=90(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 2
LDI r2, 90
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
