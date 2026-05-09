; DESCRIPTION: Renders a magenta box of size 110x58 starting at (90, 197).
; PLAN: r0=90(x), r1=197(y), r2=110(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 197
LDI r2, 110
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
