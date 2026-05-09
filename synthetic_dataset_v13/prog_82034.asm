; DESCRIPTION: Renders a white box of size 60x18 starting at (56, 92).
; PLAN: r0=56(x), r1=92(y), r2=60(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 92
LDI r2, 60
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
