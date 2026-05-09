; DESCRIPTION: Renders a green box of size 22x111 starting at (448, 35).
; PLAN: r0=448(x), r1=35(y), r2=22(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 35
LDI r2, 22
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
