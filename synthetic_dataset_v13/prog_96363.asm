; DESCRIPTION: Renders a yellow box of size 102x15 starting at (221, 135).
; PLAN: r0=221(x), r1=135(y), r2=102(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 135
LDI r2, 102
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
