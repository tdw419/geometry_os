; DESCRIPTION: Renders a yellow box of size 65x32 starting at (103, 135).
; PLAN: r0=103(x), r1=135(y), r2=65(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 135
LDI r2, 65
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
