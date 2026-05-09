; DESCRIPTION: Renders a yellow box of size 58x13 starting at (296, 48).
; PLAN: r0=296(x), r1=48(y), r2=58(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 48
LDI r2, 58
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
