; DESCRIPTION: Renders a orange box of size 114x93 starting at (317, 17).
; PLAN: r0=317(x), r1=17(y), r2=114(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 17
LDI r2, 114
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
