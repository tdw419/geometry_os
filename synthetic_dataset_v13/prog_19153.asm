; DESCRIPTION: Renders a yellow box of size 101x93 starting at (225, 65).
; PLAN: r0=225(x), r1=65(y), r2=101(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 65
LDI r2, 101
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
