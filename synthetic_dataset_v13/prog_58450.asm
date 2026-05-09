; DESCRIPTION: Renders a white box of size 92x71 starting at (166, 145).
; PLAN: r0=166(x), r1=145(y), r2=92(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 145
LDI r2, 92
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
