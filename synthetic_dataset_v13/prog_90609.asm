; DESCRIPTION: Renders a yellow box of size 64x94 starting at (29, 23).
; PLAN: r0=29(x), r1=23(y), r2=64(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 23
LDI r2, 64
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
