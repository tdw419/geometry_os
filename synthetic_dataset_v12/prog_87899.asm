; DESCRIPTION: Renders a white box of size 39x59 starting at (100, 78).
; PLAN: r0=100(x), r1=78(y), r2=39(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 78
LDI r2, 39
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
