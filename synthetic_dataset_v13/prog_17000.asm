; DESCRIPTION: Renders a white box of size 103x46 starting at (155, 11).
; PLAN: r0=155(x), r1=11(y), r2=103(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 11
LDI r2, 103
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
