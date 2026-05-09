; DESCRIPTION: Renders a white box of size 45x66 starting at (151, 83).
; PLAN: r0=151(x), r1=83(y), r2=45(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 83
LDI r2, 45
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
