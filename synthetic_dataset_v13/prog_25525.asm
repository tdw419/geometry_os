; DESCRIPTION: Renders a yellow box of size 92x35 starting at (357, 33).
; PLAN: r0=357(x), r1=33(y), r2=92(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 33
LDI r2, 92
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
