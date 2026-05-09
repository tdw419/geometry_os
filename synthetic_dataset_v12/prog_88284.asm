; DESCRIPTION: Renders a white box of size 20x94 starting at (417, 68).
; PLAN: r0=417(x), r1=68(y), r2=20(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 68
LDI r2, 20
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
