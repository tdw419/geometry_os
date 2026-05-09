; DESCRIPTION: Renders a yellow box of size 51x27 starting at (250, 112).
; PLAN: r0=250(x), r1=112(y), r2=51(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 112
LDI r2, 51
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
