; DESCRIPTION: Renders a white box of size 52x112 starting at (45, 21).
; PLAN: r0=45(x), r1=21(y), r2=52(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 21
LDI r2, 52
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
