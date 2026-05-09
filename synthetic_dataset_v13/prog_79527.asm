; DESCRIPTION: Renders a orange box of size 97x71 starting at (61, 70).
; PLAN: r0=61(x), r1=70(y), r2=97(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 70
LDI r2, 97
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
