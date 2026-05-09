; DESCRIPTION: Renders a yellow box of size 83x54 starting at (216, 12).
; PLAN: r0=216(x), r1=12(y), r2=83(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 12
LDI r2, 83
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
