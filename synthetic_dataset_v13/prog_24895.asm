; DESCRIPTION: Renders a white box of size 42x23 starting at (247, 156).
; PLAN: r0=247(x), r1=156(y), r2=42(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 156
LDI r2, 42
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
