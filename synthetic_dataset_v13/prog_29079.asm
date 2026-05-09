; DESCRIPTION: Renders a orange box of size 36x61 starting at (26, 19).
; PLAN: r0=26(x), r1=19(y), r2=36(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 19
LDI r2, 36
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
