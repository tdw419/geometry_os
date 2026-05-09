; DESCRIPTION: Renders a purple box of size 105x13 starting at (136, 146).
; PLAN: r0=136(x), r1=146(y), r2=105(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 146
LDI r2, 105
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
