; DESCRIPTION: Renders a orange box of size 35x74 starting at (60, 12).
; PLAN: r0=60(x), r1=12(y), r2=35(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 12
LDI r2, 35
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
