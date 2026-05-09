; DESCRIPTION: Renders a orange box of size 29x26 starting at (103, 199).
; PLAN: r0=103(x), r1=199(y), r2=29(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 199
LDI r2, 29
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
