; DESCRIPTION: Renders a orange box of size 11x54 starting at (170, 190).
; PLAN: r0=170(x), r1=190(y), r2=11(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 190
LDI r2, 11
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
