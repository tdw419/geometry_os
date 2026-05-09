; DESCRIPTION: Renders a white box of size 81x35 starting at (156, 117).
; PLAN: r0=156(x), r1=117(y), r2=81(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 117
LDI r2, 81
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
