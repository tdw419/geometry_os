; DESCRIPTION: Renders a orange box of size 34x57 starting at (390, 20).
; PLAN: r0=390(x), r1=20(y), r2=34(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 20
LDI r2, 34
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
