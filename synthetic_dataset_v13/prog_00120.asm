; DESCRIPTION: Renders a yellow box of size 60x14 starting at (258, 229).
; PLAN: r0=258(x), r1=229(y), r2=60(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 229
LDI r2, 60
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
