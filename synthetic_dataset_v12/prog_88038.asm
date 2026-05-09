; DESCRIPTION: Renders a orange box of size 43x32 starting at (222, 129).
; PLAN: r0=222(x), r1=129(y), r2=43(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 129
LDI r2, 43
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
