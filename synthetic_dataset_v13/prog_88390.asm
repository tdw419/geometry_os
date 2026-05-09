; DESCRIPTION: Renders a yellow box of size 109x24 starting at (396, 59).
; PLAN: r0=396(x), r1=59(y), r2=109(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 59
LDI r2, 109
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
