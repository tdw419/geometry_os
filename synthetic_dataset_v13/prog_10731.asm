; DESCRIPTION: Renders a orange box of size 101x56 starting at (243, 101).
; PLAN: r0=243(x), r1=101(y), r2=101(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 101
LDI r2, 101
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
