; DESCRIPTION: Renders a orange box of size 97x47 starting at (157, 121).
; PLAN: r0=157(x), r1=121(y), r2=97(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 121
LDI r2, 97
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
