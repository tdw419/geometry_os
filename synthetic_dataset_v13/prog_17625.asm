; DESCRIPTION: Renders a white box of size 117x15 starting at (358, 211).
; PLAN: r0=358(x), r1=211(y), r2=117(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 211
LDI r2, 117
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
