; DESCRIPTION: Renders a orange box of size 90x113 starting at (216, 72).
; PLAN: r0=216(x), r1=72(y), r2=90(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 72
LDI r2, 90
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
