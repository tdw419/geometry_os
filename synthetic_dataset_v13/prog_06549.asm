; DESCRIPTION: Renders a orange box of size 38x26 starting at (44, 92).
; PLAN: r0=44(x), r1=92(y), r2=38(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 92
LDI r2, 38
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
