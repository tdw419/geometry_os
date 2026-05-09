; DESCRIPTION: Renders a white box of size 45x58 starting at (26, 175).
; PLAN: r0=26(x), r1=175(y), r2=45(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 175
LDI r2, 45
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
