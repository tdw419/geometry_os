; DESCRIPTION: Renders a yellow box of size 36x25 starting at (254, 145).
; PLAN: r0=254(x), r1=145(y), r2=36(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 145
LDI r2, 36
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
