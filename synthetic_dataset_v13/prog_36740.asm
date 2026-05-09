; DESCRIPTION: Renders a white box of size 103x63 starting at (155, 12).
; PLAN: r0=155(x), r1=12(y), r2=103(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 12
LDI r2, 103
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
