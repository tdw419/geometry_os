; DESCRIPTION: Renders a yellow box of size 63x62 starting at (328, 11).
; PLAN: r0=328(x), r1=11(y), r2=63(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 11
LDI r2, 63
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
