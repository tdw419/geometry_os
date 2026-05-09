; DESCRIPTION: Renders a white box of size 42x68 starting at (92, 183).
; PLAN: r0=92(x), r1=183(y), r2=42(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 183
LDI r2, 42
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
