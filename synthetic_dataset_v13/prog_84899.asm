; DESCRIPTION: Renders a orange box of size 59x56 starting at (431, 77).
; PLAN: r0=431(x), r1=77(y), r2=59(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 77
LDI r2, 59
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
