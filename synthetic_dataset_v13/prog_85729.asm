; DESCRIPTION: Renders a black box of size 79x70 starting at (297, 43).
; PLAN: r0=297(x), r1=43(y), r2=79(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 43
LDI r2, 79
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
