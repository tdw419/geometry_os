; DESCRIPTION: Renders a white box of size 35x94 starting at (252, 73).
; PLAN: r0=252(x), r1=73(y), r2=35(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 73
LDI r2, 35
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
