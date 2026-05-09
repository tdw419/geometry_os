; DESCRIPTION: Renders a white box of size 100x100 starting at (285, 90).
; PLAN: r0=285(x), r1=90(y), r2=100(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 90
LDI r2, 100
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
