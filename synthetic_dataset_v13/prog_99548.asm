; DESCRIPTION: Renders a orange box of size 108x94 starting at (315, 97).
; PLAN: r0=315(x), r1=97(y), r2=108(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 97
LDI r2, 108
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
