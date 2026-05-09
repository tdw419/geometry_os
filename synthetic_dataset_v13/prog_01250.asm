; DESCRIPTION: Renders a yellow box of size 103x73 starting at (21, 155).
; PLAN: r0=21(x), r1=155(y), r2=103(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 155
LDI r2, 103
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
