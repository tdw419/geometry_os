; DESCRIPTION: Renders a white box of size 15x94 starting at (224, 52).
; PLAN: r0=224(x), r1=52(y), r2=15(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 52
LDI r2, 15
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
