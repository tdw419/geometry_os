; DESCRIPTION: Renders a orange box of size 22x24 starting at (343, 94).
; PLAN: r0=343(x), r1=94(y), r2=22(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 94
LDI r2, 22
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
