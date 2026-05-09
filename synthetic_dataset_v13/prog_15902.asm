; DESCRIPTION: Renders a orange box of size 116x86 starting at (122, 66).
; PLAN: r0=122(x), r1=66(y), r2=116(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 66
LDI r2, 116
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
