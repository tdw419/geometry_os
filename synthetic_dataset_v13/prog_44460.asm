; DESCRIPTION: Renders a orange box of size 37x106 starting at (24, 7).
; PLAN: r0=24(x), r1=7(y), r2=37(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 7
LDI r2, 37
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
