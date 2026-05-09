; DESCRIPTION: Renders a white box of size 82x21 starting at (381, 42).
; PLAN: r0=381(x), r1=42(y), r2=82(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 42
LDI r2, 82
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
