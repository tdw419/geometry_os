; DESCRIPTION: Renders a orange box of size 81x115 starting at (285, 118).
; PLAN: r0=285(x), r1=118(y), r2=81(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 118
LDI r2, 81
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
