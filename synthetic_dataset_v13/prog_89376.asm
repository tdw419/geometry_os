; DESCRIPTION: Renders a orange box of size 72x24 starting at (2, 26).
; PLAN: r0=2(x), r1=26(y), r2=72(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 26
LDI r2, 72
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
