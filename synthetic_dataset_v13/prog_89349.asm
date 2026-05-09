; DESCRIPTION: Renders a purple box of size 84x40 starting at (156, 138).
; PLAN: r0=156(x), r1=138(y), r2=84(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 138
LDI r2, 84
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
