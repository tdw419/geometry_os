; DESCRIPTION: Renders a orange box of size 107x96 starting at (352, 99).
; PLAN: r0=352(x), r1=99(y), r2=107(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 99
LDI r2, 107
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
