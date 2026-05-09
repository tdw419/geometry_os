; DESCRIPTION: Renders a white box of size 63x12 starting at (322, 47).
; PLAN: r0=322(x), r1=47(y), r2=63(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 47
LDI r2, 63
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
