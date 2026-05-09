; DESCRIPTION: Renders a orange box of size 77x59 starting at (419, 27).
; PLAN: r0=419(x), r1=27(y), r2=77(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 27
LDI r2, 77
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
