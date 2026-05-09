; DESCRIPTION: Renders a orange box of size 19x116 starting at (374, 7).
; PLAN: r0=374(x), r1=7(y), r2=19(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 7
LDI r2, 19
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
