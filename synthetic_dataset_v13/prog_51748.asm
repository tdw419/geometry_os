; DESCRIPTION: Renders a orange box of size 48x50 starting at (138, 101).
; PLAN: r0=138(x), r1=101(y), r2=48(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 101
LDI r2, 48
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
