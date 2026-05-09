; DESCRIPTION: Renders a white box of size 28x78 starting at (262, 0).
; PLAN: r0=262(x), r1=0(y), r2=28(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 0
LDI r2, 28
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
