; DESCRIPTION: Renders a white box of size 60x58 starting at (195, 74).
; PLAN: r0=195(x), r1=74(y), r2=60(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 74
LDI r2, 60
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
