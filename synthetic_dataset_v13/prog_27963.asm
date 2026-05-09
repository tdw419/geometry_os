; DESCRIPTION: Renders a white box of size 112x61 starting at (151, 40).
; PLAN: r0=151(x), r1=40(y), r2=112(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 40
LDI r2, 112
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
