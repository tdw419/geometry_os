; DESCRIPTION: Renders a yellow box of size 119x36 starting at (21, 45).
; PLAN: r0=21(x), r1=45(y), r2=119(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 45
LDI r2, 119
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
