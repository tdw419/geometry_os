; DESCRIPTION: Renders a blue box of size 115x64 starting at (325, 0).
; PLAN: r0=325(x), r1=0(y), r2=115(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 0
LDI r2, 115
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
