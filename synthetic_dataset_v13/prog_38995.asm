; DESCRIPTION: Renders a yellow box of size 51x102 starting at (303, 20).
; PLAN: r0=303(x), r1=20(y), r2=51(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 20
LDI r2, 51
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
