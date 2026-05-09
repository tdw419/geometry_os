; DESCRIPTION: Renders a orange box of size 48x11 starting at (226, 158).
; PLAN: r0=226(x), r1=158(y), r2=48(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 158
LDI r2, 48
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
