; DESCRIPTION: Renders a orange box of size 24x76 starting at (151, 85).
; PLAN: r0=151(x), r1=85(y), r2=24(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 85
LDI r2, 24
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
