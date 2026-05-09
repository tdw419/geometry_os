; DESCRIPTION: Renders a yellow box of size 51x35 starting at (233, 221).
; PLAN: r0=233(x), r1=221(y), r2=51(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 221
LDI r2, 51
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
