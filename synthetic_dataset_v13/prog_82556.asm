; DESCRIPTION: Renders a orange box of size 77x63 starting at (59, 185).
; PLAN: r0=59(x), r1=185(y), r2=77(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 185
LDI r2, 77
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
