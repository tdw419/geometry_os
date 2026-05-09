; DESCRIPTION: Renders a yellow box of size 64x59 starting at (158, 31).
; PLAN: r0=158(x), r1=31(y), r2=64(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 31
LDI r2, 64
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
