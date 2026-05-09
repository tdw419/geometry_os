; DESCRIPTION: Renders a orange box of size 52x43 starting at (269, 36).
; PLAN: r0=269(x), r1=36(y), r2=52(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 36
LDI r2, 52
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
