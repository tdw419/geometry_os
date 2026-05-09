; DESCRIPTION: Renders a yellow box of size 111x32 starting at (96, 51).
; PLAN: r0=96(x), r1=51(y), r2=111(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 51
LDI r2, 111
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
