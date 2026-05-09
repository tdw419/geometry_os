; DESCRIPTION: Renders a white box of size 76x19 starting at (92, 144).
; PLAN: r0=92(x), r1=144(y), r2=76(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 144
LDI r2, 76
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
