; DESCRIPTION: Renders a orange box of size 20x28 starting at (101, 188).
; PLAN: r0=101(x), r1=188(y), r2=20(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 188
LDI r2, 20
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
