; DESCRIPTION: Renders a orange box of size 97x49 starting at (94, 0).
; PLAN: r0=94(x), r1=0(y), r2=97(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 0
LDI r2, 97
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
