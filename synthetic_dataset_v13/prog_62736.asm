; DESCRIPTION: Renders a orange box of size 108x116 starting at (224, 58).
; PLAN: r0=224(x), r1=58(y), r2=108(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 58
LDI r2, 108
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
