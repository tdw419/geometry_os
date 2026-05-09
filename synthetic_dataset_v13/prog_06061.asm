; DESCRIPTION: Renders a yellow box of size 15x11 starting at (311, 64).
; PLAN: r0=311(x), r1=64(y), r2=15(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 64
LDI r2, 15
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
