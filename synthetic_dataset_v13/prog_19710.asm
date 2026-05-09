; DESCRIPTION: Renders a white box of size 10x40 starting at (3, 68).
; PLAN: r0=3(x), r1=68(y), r2=10(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 68
LDI r2, 10
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
