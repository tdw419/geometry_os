; DESCRIPTION: Renders a black box of size 62x109 starting at (448, 102).
; PLAN: r0=448(x), r1=102(y), r2=62(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 102
LDI r2, 62
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
