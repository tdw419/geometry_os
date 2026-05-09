; DESCRIPTION: Renders a white box of size 82x80 starting at (129, 22).
; PLAN: r0=129(x), r1=22(y), r2=82(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 22
LDI r2, 82
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
