; DESCRIPTION: Renders a orange box of size 10x65 starting at (399, 155).
; PLAN: r0=399(x), r1=155(y), r2=10(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 155
LDI r2, 10
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
