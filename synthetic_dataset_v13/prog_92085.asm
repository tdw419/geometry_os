; DESCRIPTION: Renders a blue box of size 115x79 starting at (221, 36).
; PLAN: r0=221(x), r1=36(y), r2=115(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 36
LDI r2, 115
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
