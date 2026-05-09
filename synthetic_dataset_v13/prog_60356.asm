; DESCRIPTION: Renders a orange box of size 74x16 starting at (318, 176).
; PLAN: r0=318(x), r1=176(y), r2=74(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 176
LDI r2, 74
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
