; DESCRIPTION: Renders a white box of size 114x42 starting at (77, 65).
; PLAN: r0=77(x), r1=65(y), r2=114(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 65
LDI r2, 114
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
