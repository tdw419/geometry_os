; DESCRIPTION: Renders a white box of size 63x13 starting at (106, 62).
; PLAN: r0=106(x), r1=62(y), r2=63(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 62
LDI r2, 63
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
