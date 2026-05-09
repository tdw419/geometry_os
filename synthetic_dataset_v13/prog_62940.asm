; DESCRIPTION: Renders a orange box of size 63x17 starting at (116, 65).
; PLAN: r0=116(x), r1=65(y), r2=63(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 65
LDI r2, 63
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
