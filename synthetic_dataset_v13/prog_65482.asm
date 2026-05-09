; DESCRIPTION: Renders a white box of size 14x65 starting at (359, 112).
; PLAN: r0=359(x), r1=112(y), r2=14(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 112
LDI r2, 14
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
