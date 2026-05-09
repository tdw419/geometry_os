; DESCRIPTION: Renders a orange box of size 29x44 starting at (132, 212).
; PLAN: r0=132(x), r1=212(y), r2=29(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 212
LDI r2, 29
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
