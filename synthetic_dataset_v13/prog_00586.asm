; DESCRIPTION: Renders a yellow box of size 30x80 starting at (0, 65).
; PLAN: r0=0(x), r1=65(y), r2=30(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 65
LDI r2, 30
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
