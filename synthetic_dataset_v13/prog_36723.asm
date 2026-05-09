; DESCRIPTION: Renders a orange box of size 59x114 starting at (365, 122).
; PLAN: r0=365(x), r1=122(y), r2=59(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 122
LDI r2, 59
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
