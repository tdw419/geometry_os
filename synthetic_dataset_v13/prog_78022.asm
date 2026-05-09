; DESCRIPTION: Renders a orange box of size 14x67 starting at (127, 0).
; PLAN: r0=127(x), r1=0(y), r2=14(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 0
LDI r2, 14
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
