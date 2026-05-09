; DESCRIPTION: Renders a white box of size 14x24 starting at (378, 92).
; PLAN: r0=378(x), r1=92(y), r2=14(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 92
LDI r2, 14
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
