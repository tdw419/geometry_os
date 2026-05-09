; DESCRIPTION: Renders a white box of size 114x93 starting at (52, 92).
; PLAN: r0=52(x), r1=92(y), r2=114(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 92
LDI r2, 114
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
