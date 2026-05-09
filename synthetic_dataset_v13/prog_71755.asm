; DESCRIPTION: Renders a orange box of size 118x93 starting at (201, 135).
; PLAN: r0=201(x), r1=135(y), r2=118(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 135
LDI r2, 118
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
