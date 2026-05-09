; DESCRIPTION: Renders a white box of size 77x72 starting at (380, 28).
; PLAN: r0=380(x), r1=28(y), r2=77(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 28
LDI r2, 77
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
