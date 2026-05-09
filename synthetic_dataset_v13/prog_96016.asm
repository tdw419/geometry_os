; DESCRIPTION: Renders a yellow box of size 59x117 starting at (288, 35).
; PLAN: r0=288(x), r1=35(y), r2=59(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 35
LDI r2, 59
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
