; DESCRIPTION: Renders a yellow box of size 72x84 starting at (58, 150).
; PLAN: r0=58(x), r1=150(y), r2=72(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 150
LDI r2, 72
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
