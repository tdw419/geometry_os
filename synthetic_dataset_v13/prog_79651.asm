; DESCRIPTION: Renders a white box of size 84x58 starting at (279, 194).
; PLAN: r0=279(x), r1=194(y), r2=84(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 194
LDI r2, 84
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
