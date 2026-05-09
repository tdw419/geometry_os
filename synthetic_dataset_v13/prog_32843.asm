; DESCRIPTION: Renders a yellow box of size 107x33 starting at (219, 121).
; PLAN: r0=219(x), r1=121(y), r2=107(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 121
LDI r2, 107
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
