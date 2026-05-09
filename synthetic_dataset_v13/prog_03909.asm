; DESCRIPTION: Renders a orange box of size 39x92 starting at (240, 106).
; PLAN: r0=240(x), r1=106(y), r2=39(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 106
LDI r2, 39
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
