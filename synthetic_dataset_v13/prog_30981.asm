; DESCRIPTION: Renders a white box of size 63x120 starting at (241, 78).
; PLAN: r0=241(x), r1=78(y), r2=63(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 78
LDI r2, 63
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
