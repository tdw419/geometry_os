; DESCRIPTION: Renders a orange box of size 111x56 starting at (227, 96).
; PLAN: r0=227(x), r1=96(y), r2=111(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 96
LDI r2, 111
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
