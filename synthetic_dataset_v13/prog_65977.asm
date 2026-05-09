; DESCRIPTION: Renders a red box of size 67x13 starting at (154, 212).
; PLAN: r0=154(x), r1=212(y), r2=67(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 212
LDI r2, 67
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
