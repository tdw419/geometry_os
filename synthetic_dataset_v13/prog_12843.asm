; DESCRIPTION: Renders a white box of size 62x64 starting at (42, 147).
; PLAN: r0=42(x), r1=147(y), r2=62(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 147
LDI r2, 62
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
