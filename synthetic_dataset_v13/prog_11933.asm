; DESCRIPTION: Renders a yellow box of size 52x84 starting at (256, 167).
; PLAN: r0=256(x), r1=167(y), r2=52(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 167
LDI r2, 52
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
