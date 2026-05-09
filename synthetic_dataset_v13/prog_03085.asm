; DESCRIPTION: Renders a yellow box of size 49x51 starting at (393, 128).
; PLAN: r0=393(x), r1=128(y), r2=49(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 128
LDI r2, 49
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
