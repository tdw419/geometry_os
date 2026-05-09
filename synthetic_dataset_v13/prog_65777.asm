; DESCRIPTION: Renders a yellow box of size 103x106 starting at (59, 135).
; PLAN: r0=59(x), r1=135(y), r2=103(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 135
LDI r2, 103
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
