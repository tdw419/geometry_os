; DESCRIPTION: Renders a yellow box of size 119x75 starting at (336, 160).
; PLAN: r0=336(x), r1=160(y), r2=119(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 160
LDI r2, 119
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
