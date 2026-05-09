; DESCRIPTION: Renders a white box of size 42x100 starting at (6, 21).
; PLAN: r0=6(x), r1=21(y), r2=42(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 21
LDI r2, 42
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
