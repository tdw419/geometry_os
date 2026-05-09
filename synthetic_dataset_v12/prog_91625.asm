; DESCRIPTION: Renders a white box of size 63x66 starting at (137, 68).
; PLAN: r0=137(x), r1=68(y), r2=63(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 68
LDI r2, 63
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
