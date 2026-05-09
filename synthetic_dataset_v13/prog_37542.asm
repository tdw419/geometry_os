; DESCRIPTION: Renders a orange box of size 15x12 starting at (223, 26).
; PLAN: r0=223(x), r1=26(y), r2=15(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 26
LDI r2, 15
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
