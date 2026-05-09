; DESCRIPTION: Renders a yellow box of size 73x24 starting at (263, 147).
; PLAN: r0=263(x), r1=147(y), r2=73(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 147
LDI r2, 73
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
