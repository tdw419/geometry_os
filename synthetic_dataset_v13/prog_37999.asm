; DESCRIPTION: Renders a orange box of size 17x27 starting at (67, 224).
; PLAN: r0=67(x), r1=224(y), r2=17(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 224
LDI r2, 17
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
