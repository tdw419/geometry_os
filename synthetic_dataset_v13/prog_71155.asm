; DESCRIPTION: Renders a yellow box of size 24x83 starting at (250, 160).
; PLAN: r0=250(x), r1=160(y), r2=24(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 160
LDI r2, 24
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
