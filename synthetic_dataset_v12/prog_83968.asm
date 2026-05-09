; DESCRIPTION: Renders a orange box of size 13x49 starting at (378, 167).
; PLAN: r0=378(x), r1=167(y), r2=13(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 167
LDI r2, 13
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
