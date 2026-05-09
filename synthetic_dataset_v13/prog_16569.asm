; DESCRIPTION: Renders a yellow box of size 62x21 starting at (304, 93).
; PLAN: r0=304(x), r1=93(y), r2=62(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 93
LDI r2, 62
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
