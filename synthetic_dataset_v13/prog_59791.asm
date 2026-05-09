; DESCRIPTION: Renders a white box of size 84x100 starting at (57, 148).
; PLAN: r0=57(x), r1=148(y), r2=84(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 148
LDI r2, 84
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
