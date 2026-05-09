; DESCRIPTION: Renders a orange box of size 44x93 starting at (110, 100).
; PLAN: r0=110(x), r1=100(y), r2=44(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 100
LDI r2, 44
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
