; DESCRIPTION: Renders a yellow box of size 59x105 starting at (117, 96).
; PLAN: r0=117(x), r1=96(y), r2=59(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 96
LDI r2, 59
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
