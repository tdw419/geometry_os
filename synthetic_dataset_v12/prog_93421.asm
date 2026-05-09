; DESCRIPTION: Renders a yellow box of size 60x58 starting at (105, 66).
; PLAN: r0=105(x), r1=66(y), r2=60(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 66
LDI r2, 60
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
