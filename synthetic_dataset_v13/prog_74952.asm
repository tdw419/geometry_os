; DESCRIPTION: Renders a yellow box of size 33x92 starting at (240, 76).
; PLAN: r0=240(x), r1=76(y), r2=33(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 76
LDI r2, 33
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
