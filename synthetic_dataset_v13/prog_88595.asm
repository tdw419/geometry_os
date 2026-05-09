; DESCRIPTION: Renders a yellow box of size 17x22 starting at (405, 51).
; PLAN: r0=405(x), r1=51(y), r2=17(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 51
LDI r2, 17
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
