; DESCRIPTION: Renders a orange box of size 25x93 starting at (156, 99).
; PLAN: r0=156(x), r1=99(y), r2=25(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 99
LDI r2, 25
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
