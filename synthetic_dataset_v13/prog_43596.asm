; DESCRIPTION: Renders a yellow box of size 73x75 starting at (237, 11).
; PLAN: r0=237(x), r1=11(y), r2=73(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 11
LDI r2, 73
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
