; DESCRIPTION: Renders a yellow box of size 51x103 starting at (81, 21).
; PLAN: r0=81(x), r1=21(y), r2=51(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 21
LDI r2, 51
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
