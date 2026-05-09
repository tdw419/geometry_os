; DESCRIPTION: Renders a orange box of size 74x99 starting at (40, 87).
; PLAN: r0=40(x), r1=87(y), r2=74(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 87
LDI r2, 74
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
