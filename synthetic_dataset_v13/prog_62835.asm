; DESCRIPTION: Renders a orange box of size 107x35 starting at (222, 28).
; PLAN: r0=222(x), r1=28(y), r2=107(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 28
LDI r2, 107
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
