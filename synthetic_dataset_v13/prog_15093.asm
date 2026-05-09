; DESCRIPTION: Renders a orange box of size 109x71 starting at (62, 144).
; PLAN: r0=62(x), r1=144(y), r2=109(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 144
LDI r2, 109
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
