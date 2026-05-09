; DESCRIPTION: Renders a orange box of size 103x52 starting at (54, 190).
; PLAN: r0=54(x), r1=190(y), r2=103(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 190
LDI r2, 103
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
