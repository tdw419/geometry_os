; DESCRIPTION: Renders a yellow box of size 73x77 starting at (20, 51).
; PLAN: r0=20(x), r1=51(y), r2=73(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 51
LDI r2, 73
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
