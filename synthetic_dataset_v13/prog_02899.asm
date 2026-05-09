; DESCRIPTION: Renders a orange box of size 101x107 starting at (39, 20).
; PLAN: r0=39(x), r1=20(y), r2=101(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 20
LDI r2, 101
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
