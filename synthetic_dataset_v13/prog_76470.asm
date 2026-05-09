; DESCRIPTION: Renders a orange box of size 14x26 starting at (153, 12).
; PLAN: r0=153(x), r1=12(y), r2=14(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 12
LDI r2, 14
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
