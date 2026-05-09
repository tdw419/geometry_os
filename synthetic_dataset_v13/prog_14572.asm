; DESCRIPTION: Renders a orange box of size 96x35 starting at (72, 205).
; PLAN: r0=72(x), r1=205(y), r2=96(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 205
LDI r2, 96
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
