; DESCRIPTION: Renders a blue box of size 112x64 starting at (136, 127).
; PLAN: r0=136(x), r1=127(y), r2=112(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 127
LDI r2, 112
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
