; DESCRIPTION: Renders a orange box of size 107x100 starting at (179, 56).
; PLAN: r0=179(x), r1=56(y), r2=107(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 56
LDI r2, 107
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
