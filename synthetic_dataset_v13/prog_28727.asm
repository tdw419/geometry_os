; DESCRIPTION: Renders a orange box of size 76x77 starting at (97, 54).
; PLAN: r0=97(x), r1=54(y), r2=76(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 54
LDI r2, 76
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
