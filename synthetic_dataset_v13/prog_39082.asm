; DESCRIPTION: Renders a white box of size 36x94 starting at (143, 71).
; PLAN: r0=143(x), r1=71(y), r2=36(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 71
LDI r2, 36
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
