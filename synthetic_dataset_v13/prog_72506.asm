; DESCRIPTION: Renders a white box of size 96x29 starting at (158, 13).
; PLAN: r0=158(x), r1=13(y), r2=96(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 13
LDI r2, 96
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
