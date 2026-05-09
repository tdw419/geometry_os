; DESCRIPTION: Renders a white box of size 94x88 starting at (267, 18).
; PLAN: r0=267(x), r1=18(y), r2=94(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 18
LDI r2, 94
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
