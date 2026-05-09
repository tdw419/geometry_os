; DESCRIPTION: Renders a white box of size 63x42 starting at (379, 154).
; PLAN: r0=379(x), r1=154(y), r2=63(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 154
LDI r2, 63
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
