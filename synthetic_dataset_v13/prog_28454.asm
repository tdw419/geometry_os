; DESCRIPTION: Renders a orange box of size 97x39 starting at (221, 115).
; PLAN: r0=221(x), r1=115(y), r2=97(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 115
LDI r2, 97
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
