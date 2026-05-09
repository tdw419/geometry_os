; DESCRIPTION: Renders a white box of size 120x63 starting at (0, 122).
; PLAN: r0=0(x), r1=122(y), r2=120(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 122
LDI r2, 120
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
