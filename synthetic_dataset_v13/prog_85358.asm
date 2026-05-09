; DESCRIPTION: Renders a orange box of size 77x33 starting at (145, 138).
; PLAN: r0=145(x), r1=138(y), r2=77(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 138
LDI r2, 77
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
