; DESCRIPTION: Renders a yellow box of size 35x77 starting at (396, 33).
; PLAN: r0=396(x), r1=33(y), r2=35(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 33
LDI r2, 35
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
