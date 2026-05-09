; DESCRIPTION: Renders a orange box of size 91x96 starting at (330, 39).
; PLAN: r0=330(x), r1=39(y), r2=91(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 39
LDI r2, 91
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
