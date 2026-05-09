; DESCRIPTION: Renders a white box of size 64x85 starting at (147, 8).
; PLAN: r0=147(x), r1=8(y), r2=64(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 8
LDI r2, 64
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
