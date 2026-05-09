; DESCRIPTION: Renders a green box of size 26x92 starting at (375, 153).
; PLAN: r0=375(x), r1=153(y), r2=26(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 153
LDI r2, 26
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
