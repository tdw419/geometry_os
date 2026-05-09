; DESCRIPTION: Renders a orange box of size 48x116 starting at (15, 56).
; PLAN: r0=15(x), r1=56(y), r2=48(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 56
LDI r2, 48
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
