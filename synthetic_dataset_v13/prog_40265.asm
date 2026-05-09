; DESCRIPTION: Renders a orange box of size 106x107 starting at (330, 100).
; PLAN: r0=330(x), r1=100(y), r2=106(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 100
LDI r2, 106
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
