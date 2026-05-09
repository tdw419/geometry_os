; DESCRIPTION: Renders a yellow box of size 72x54 starting at (181, 6).
; PLAN: r0=181(x), r1=6(y), r2=72(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 6
LDI r2, 72
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
