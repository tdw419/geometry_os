; DESCRIPTION: Renders a white box of size 89x109 starting at (274, 72).
; PLAN: r0=274(x), r1=72(y), r2=89(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 72
LDI r2, 89
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
