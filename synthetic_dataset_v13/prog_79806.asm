; DESCRIPTION: Renders a yellow box of size 91x55 starting at (289, 63).
; PLAN: r0=289(x), r1=63(y), r2=91(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 63
LDI r2, 91
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
