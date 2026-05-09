; DESCRIPTION: Renders a orange box of size 67x17 starting at (315, 166).
; PLAN: r0=315(x), r1=166(y), r2=67(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 166
LDI r2, 67
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
