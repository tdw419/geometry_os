; DESCRIPTION: Renders a orange box of size 68x118 starting at (226, 93).
; PLAN: r0=226(x), r1=93(y), r2=68(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 93
LDI r2, 68
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
