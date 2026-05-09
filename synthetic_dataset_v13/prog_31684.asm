; DESCRIPTION: Renders a yellow box of size 117x11 starting at (325, 37).
; PLAN: r0=325(x), r1=37(y), r2=117(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 37
LDI r2, 117
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
