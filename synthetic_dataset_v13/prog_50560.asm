; DESCRIPTION: Renders a orange box of size 111x17 starting at (117, 114).
; PLAN: r0=117(x), r1=114(y), r2=111(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 114
LDI r2, 111
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
