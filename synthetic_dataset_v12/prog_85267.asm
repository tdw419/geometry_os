; DESCRIPTION: Renders a white box of size 87x32 starting at (325, 134).
; PLAN: r0=325(x), r1=134(y), r2=87(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 134
LDI r2, 87
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
