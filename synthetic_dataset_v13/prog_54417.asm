; DESCRIPTION: Renders a white box of size 87x64 starting at (163, 138).
; PLAN: r0=163(x), r1=138(y), r2=87(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 138
LDI r2, 87
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
