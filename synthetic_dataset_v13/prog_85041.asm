; DESCRIPTION: Renders a white box of size 115x34 starting at (10, 61).
; PLAN: r0=10(x), r1=61(y), r2=115(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 61
LDI r2, 115
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
