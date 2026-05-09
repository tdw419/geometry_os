; DESCRIPTION: Renders a white box of size 42x66 starting at (150, 158).
; PLAN: r0=150(x), r1=158(y), r2=42(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 158
LDI r2, 42
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
