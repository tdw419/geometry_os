; DESCRIPTION: Renders a orange box of size 105x13 starting at (21, 190).
; PLAN: r0=21(x), r1=190(y), r2=105(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 190
LDI r2, 105
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
