; DESCRIPTION: Renders a white box of size 80x34 starting at (117, 28).
; PLAN: r0=117(x), r1=28(y), r2=80(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 28
LDI r2, 80
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
