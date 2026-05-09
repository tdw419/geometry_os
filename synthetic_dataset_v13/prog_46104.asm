; DESCRIPTION: Renders a orange box of size 67x92 starting at (265, 142).
; PLAN: r0=265(x), r1=142(y), r2=67(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 142
LDI r2, 67
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
