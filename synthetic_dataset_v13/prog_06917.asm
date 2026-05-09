; DESCRIPTION: Renders a orange box of size 34x56 starting at (164, 181).
; PLAN: r0=164(x), r1=181(y), r2=34(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 181
LDI r2, 34
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
