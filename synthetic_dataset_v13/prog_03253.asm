; DESCRIPTION: Renders a white box of size 64x31 starting at (361, 192).
; PLAN: r0=361(x), r1=192(y), r2=64(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 192
LDI r2, 64
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
