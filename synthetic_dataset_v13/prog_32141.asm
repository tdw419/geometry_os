; DESCRIPTION: Renders a yellow box of size 64x32 starting at (2, 144).
; PLAN: r0=2(x), r1=144(y), r2=64(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 144
LDI r2, 64
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
