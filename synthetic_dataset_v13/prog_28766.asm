; DESCRIPTION: Renders a yellow box of size 83x25 starting at (377, 12).
; PLAN: r0=377(x), r1=12(y), r2=83(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 12
LDI r2, 83
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
