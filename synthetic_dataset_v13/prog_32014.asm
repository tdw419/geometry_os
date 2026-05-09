; DESCRIPTION: Renders a white box of size 58x93 starting at (233, 74).
; PLAN: r0=233(x), r1=74(y), r2=58(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 74
LDI r2, 58
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
