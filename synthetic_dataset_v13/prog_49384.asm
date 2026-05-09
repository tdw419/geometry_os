; DESCRIPTION: Renders a yellow box of size 32x72 starting at (137, 11).
; PLAN: r0=137(x), r1=11(y), r2=32(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 11
LDI r2, 32
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
