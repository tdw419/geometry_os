; DESCRIPTION: Renders a white box of size 103x114 starting at (28, 135).
; PLAN: r0=28(x), r1=135(y), r2=103(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 135
LDI r2, 103
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
