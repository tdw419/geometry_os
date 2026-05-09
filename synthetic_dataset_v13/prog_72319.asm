; DESCRIPTION: Renders a white box of size 85x102 starting at (129, 10).
; PLAN: r0=129(x), r1=10(y), r2=85(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 10
LDI r2, 85
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
