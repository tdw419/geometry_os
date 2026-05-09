; DESCRIPTION: Renders a orange box of size 14x77 starting at (306, 13).
; PLAN: r0=306(x), r1=13(y), r2=14(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 13
LDI r2, 14
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
