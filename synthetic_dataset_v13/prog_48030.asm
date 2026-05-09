; DESCRIPTION: Renders a yellow box of size 51x38 starting at (9, 103).
; PLAN: r0=9(x), r1=103(y), r2=51(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 103
LDI r2, 51
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
