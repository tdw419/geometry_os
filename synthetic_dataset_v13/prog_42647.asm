; DESCRIPTION: Renders a yellow box of size 27x119 starting at (436, 23).
; PLAN: r0=436(x), r1=23(y), r2=27(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 23
LDI r2, 27
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
