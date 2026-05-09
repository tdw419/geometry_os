; DESCRIPTION: Renders a orange box of size 33x11 starting at (4, 71).
; PLAN: r0=4(x), r1=71(y), r2=33(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 71
LDI r2, 33
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
