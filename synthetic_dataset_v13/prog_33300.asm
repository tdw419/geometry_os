; DESCRIPTION: Renders a yellow box of size 79x96 starting at (73, 24).
; PLAN: r0=73(x), r1=24(y), r2=79(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 24
LDI r2, 79
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
