; DESCRIPTION: Renders a white box of size 13x48 starting at (286, 122).
; PLAN: r0=286(x), r1=122(y), r2=13(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 122
LDI r2, 13
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
