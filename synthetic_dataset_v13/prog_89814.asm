; DESCRIPTION: Renders a white box of size 72x52 starting at (247, 26).
; PLAN: r0=247(x), r1=26(y), r2=72(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 26
LDI r2, 72
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
