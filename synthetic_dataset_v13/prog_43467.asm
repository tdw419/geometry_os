; DESCRIPTION: Renders a orange box of size 31x117 starting at (28, 24).
; PLAN: r0=28(x), r1=24(y), r2=31(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 24
LDI r2, 31
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
