; DESCRIPTION: Renders a white box of size 52x94 starting at (319, 124).
; PLAN: r0=319(x), r1=124(y), r2=52(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 124
LDI r2, 52
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
