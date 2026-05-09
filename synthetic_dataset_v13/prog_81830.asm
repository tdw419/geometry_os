; DESCRIPTION: Renders a orange box of size 107x62 starting at (378, 81).
; PLAN: r0=378(x), r1=81(y), r2=107(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 81
LDI r2, 107
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
