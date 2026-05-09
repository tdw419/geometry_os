; DESCRIPTION: Renders a white box of size 65x105 starting at (136, 94).
; PLAN: r0=136(x), r1=94(y), r2=65(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 94
LDI r2, 65
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
