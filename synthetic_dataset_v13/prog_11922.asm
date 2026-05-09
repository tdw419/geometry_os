; DESCRIPTION: Renders a yellow box of size 40x21 starting at (128, 58).
; PLAN: r0=128(x), r1=58(y), r2=40(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 58
LDI r2, 40
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
