; DESCRIPTION: Renders a yellow box of size 18x65 starting at (73, 155).
; PLAN: r0=73(x), r1=155(y), r2=18(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 155
LDI r2, 18
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
