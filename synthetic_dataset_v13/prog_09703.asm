; DESCRIPTION: Renders a white box of size 15x57 starting at (126, 99).
; PLAN: r0=126(x), r1=99(y), r2=15(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 99
LDI r2, 15
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
