; DESCRIPTION: Renders a orange box of size 15x23 starting at (181, 27).
; PLAN: r0=181(x), r1=27(y), r2=15(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 27
LDI r2, 15
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
