; DESCRIPTION: Renders a yellow box of size 120x69 starting at (51, 146).
; PLAN: r0=51(x), r1=146(y), r2=120(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 146
LDI r2, 120
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
