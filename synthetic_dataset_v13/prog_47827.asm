; DESCRIPTION: Renders a orange box of size 11x92 starting at (409, 134).
; PLAN: r0=409(x), r1=134(y), r2=11(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 134
LDI r2, 11
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
