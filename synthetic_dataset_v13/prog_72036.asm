; DESCRIPTION: Renders a orange box of size 112x107 starting at (61, 25).
; PLAN: r0=61(x), r1=25(y), r2=112(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 25
LDI r2, 112
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
