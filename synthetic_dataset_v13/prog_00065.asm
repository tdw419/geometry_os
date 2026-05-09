; DESCRIPTION: Renders a white box of size 66x117 starting at (80, 129).
; PLAN: r0=80(x), r1=129(y), r2=66(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 129
LDI r2, 66
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
