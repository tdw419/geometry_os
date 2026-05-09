; DESCRIPTION: Renders a orange box of size 83x78 starting at (240, 139).
; PLAN: r0=240(x), r1=139(y), r2=83(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 139
LDI r2, 83
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
