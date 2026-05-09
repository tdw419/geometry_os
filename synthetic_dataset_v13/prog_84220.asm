; DESCRIPTION: Renders a orange box of size 114x61 starting at (227, 92).
; PLAN: r0=227(x), r1=92(y), r2=114(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 92
LDI r2, 114
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
