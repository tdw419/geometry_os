; DESCRIPTION: Renders a orange box of size 27x83 starting at (93, 101).
; PLAN: r0=93(x), r1=101(y), r2=27(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 101
LDI r2, 27
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
