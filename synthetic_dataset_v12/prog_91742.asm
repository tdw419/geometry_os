; DESCRIPTION: Renders a white box of size 58x80 starting at (381, 136).
; PLAN: r0=381(x), r1=136(y), r2=58(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 136
LDI r2, 58
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
