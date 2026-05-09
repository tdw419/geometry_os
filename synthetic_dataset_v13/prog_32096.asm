; DESCRIPTION: Renders a yellow box of size 29x80 starting at (81, 93).
; PLAN: r0=81(x), r1=93(y), r2=29(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 93
LDI r2, 29
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
