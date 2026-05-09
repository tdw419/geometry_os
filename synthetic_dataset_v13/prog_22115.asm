; DESCRIPTION: Renders a orange box of size 86x116 starting at (251, 9).
; PLAN: r0=251(x), r1=9(y), r2=86(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 9
LDI r2, 86
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
