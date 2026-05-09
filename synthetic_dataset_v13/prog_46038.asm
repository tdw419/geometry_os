; DESCRIPTION: Renders a yellow box of size 17x63 starting at (363, 65).
; PLAN: r0=363(x), r1=65(y), r2=17(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 65
LDI r2, 17
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
