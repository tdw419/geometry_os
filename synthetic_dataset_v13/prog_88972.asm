; DESCRIPTION: Renders a orange box of size 108x97 starting at (73, 7).
; PLAN: r0=73(x), r1=7(y), r2=108(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 7
LDI r2, 108
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
