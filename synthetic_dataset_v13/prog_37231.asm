; DESCRIPTION: Renders a white box of size 31x64 starting at (270, 64).
; PLAN: r0=270(x), r1=64(y), r2=31(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 64
LDI r2, 31
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
