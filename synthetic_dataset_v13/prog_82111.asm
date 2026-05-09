; DESCRIPTION: Renders a orange box of size 105x107 starting at (205, 32).
; PLAN: r0=205(x), r1=32(y), r2=105(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 32
LDI r2, 105
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
