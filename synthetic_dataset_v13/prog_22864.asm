; DESCRIPTION: Renders a white box of size 119x21 starting at (103, 74).
; PLAN: r0=103(x), r1=74(y), r2=119(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 74
LDI r2, 119
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
