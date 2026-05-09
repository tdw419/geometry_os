; DESCRIPTION: Renders a orange box of size 29x66 starting at (244, 27).
; PLAN: r0=244(x), r1=27(y), r2=29(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 27
LDI r2, 29
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
