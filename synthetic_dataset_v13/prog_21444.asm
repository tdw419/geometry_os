; DESCRIPTION: Renders a orange box of size 83x93 starting at (80, 25).
; PLAN: r0=80(x), r1=25(y), r2=83(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 25
LDI r2, 83
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
