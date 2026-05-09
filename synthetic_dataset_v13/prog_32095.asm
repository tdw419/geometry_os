; DESCRIPTION: Renders a white box of size 18x66 starting at (349, 6).
; PLAN: r0=349(x), r1=6(y), r2=18(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 6
LDI r2, 18
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
