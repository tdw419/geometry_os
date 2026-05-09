; DESCRIPTION: Renders a orange box of size 85x94 starting at (241, 139).
; PLAN: r0=241(x), r1=139(y), r2=85(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 139
LDI r2, 85
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
