; DESCRIPTION: Renders a white box of size 82x51 starting at (66, 62).
; PLAN: r0=66(x), r1=62(y), r2=82(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 62
LDI r2, 82
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
