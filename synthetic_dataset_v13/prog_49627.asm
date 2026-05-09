; DESCRIPTION: Renders a white box of size 92x18 starting at (151, 28).
; PLAN: r0=151(x), r1=28(y), r2=92(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 28
LDI r2, 92
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
