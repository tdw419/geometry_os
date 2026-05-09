; DESCRIPTION: Renders a yellow box of size 63x111 starting at (368, 97).
; PLAN: r0=368(x), r1=97(y), r2=63(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 97
LDI r2, 63
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
