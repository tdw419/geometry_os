; DESCRIPTION: Renders a orange box of size 97x21 starting at (359, 91).
; PLAN: r0=359(x), r1=91(y), r2=97(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 91
LDI r2, 97
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
