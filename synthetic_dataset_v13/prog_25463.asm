; DESCRIPTION: Renders a white box of size 62x112 starting at (174, 129).
; PLAN: r0=174(x), r1=129(y), r2=62(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 129
LDI r2, 62
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
