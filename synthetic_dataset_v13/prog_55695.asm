; DESCRIPTION: Renders a orange box of size 25x75 starting at (40, 93).
; PLAN: r0=40(x), r1=93(y), r2=25(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 93
LDI r2, 25
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
