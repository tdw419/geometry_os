; DESCRIPTION: Renders a white box of size 107x99 starting at (43, 119).
; PLAN: r0=43(x), r1=119(y), r2=107(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 119
LDI r2, 107
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
