; DESCRIPTION: Renders a orange box of size 26x115 starting at (468, 13).
; PLAN: r0=468(x), r1=13(y), r2=26(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 13
LDI r2, 26
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
