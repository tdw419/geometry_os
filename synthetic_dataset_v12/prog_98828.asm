; DESCRIPTION: Renders a orange box of size 44x14 starting at (101, 33).
; PLAN: r0=101(x), r1=33(y), r2=44(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 33
LDI r2, 44
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
