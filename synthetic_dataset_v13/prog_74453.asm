; DESCRIPTION: Renders a white box of size 17x61 starting at (89, 144).
; PLAN: r0=89(x), r1=144(y), r2=17(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 144
LDI r2, 17
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
