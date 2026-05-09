; DESCRIPTION: Renders a white box of size 45x52 starting at (206, 64).
; PLAN: r0=206(x), r1=64(y), r2=45(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 64
LDI r2, 45
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
