; DESCRIPTION: Renders a orange box of size 111x97 starting at (158, 37).
; PLAN: r0=158(x), r1=37(y), r2=111(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 37
LDI r2, 111
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
