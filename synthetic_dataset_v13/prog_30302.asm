; DESCRIPTION: Renders a orange box of size 67x102 starting at (267, 134).
; PLAN: r0=267(x), r1=134(y), r2=67(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 134
LDI r2, 67
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
