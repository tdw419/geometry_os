; DESCRIPTION: Renders a orange box of size 35x60 starting at (77, 1).
; PLAN: r0=77(x), r1=1(y), r2=35(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 1
LDI r2, 35
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
